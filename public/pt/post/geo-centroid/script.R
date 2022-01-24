#' ----
#' title: centroids
#' author: mauricio vancine
#' date: 2021-12-16
#' ----

# prepare r ---------------------------------------------------------------

# packages
library(tidyverse)
library(rgdal)
library(raster)
library(terra)
library(sf)
library(geobr)
library(tmap)
library(spocc)
library(spThin)
library(dismo)
library(spatialEco)
library(diagram)

# directory
setwd("/home/mude/data/github/blogdown/content/pt/post/geo-centroid")

# occ ---------------------------------------------------------------------

# brasil
mata_atlantica <- geobr::read_biomes(year = 2004) %>% 
  dplyr::filter(name_biome == "Mata Atlântica") %>% 
  sf::st_transform(crs = 4326) %>% 
  sf::st_crop(xmin = -56, ymin = -30, xmax = -34, ymax = -5)
mata_atlantica

# download
sp <- "Haddadus binotatus"

occ_spocc <- spocc::occ(query = sp,
                        from = c("gbif", "inat", "vertnet", "idigbio", "ecoengine"),
                        has_coords = TRUE,
                        limit = 5e3) %>% 
  spocc::occ2df()
occ_spocc

# clean
pr_specie <- occ_spocc %>% 
  dplyr::mutate(species = "Haddadus bibotatus",
                longitude = as.numeric(longitude),
                latitude = as.numeric(latitude)) %>% 
  dplyr::distinct(species, longitude, latitude) %>% 
  spThin::thin(spec.col = "species",
               lat.col = "latitude",
               long.col = "longitude",
               thin.par = 25,
               reps = 1,
               write.files = FALSE,
               write.log.file = FALSE,
               locs.thinned.list.return = TRUE,
               verbose = TRUE) %>% 
  .[[1]] %>%
  tibble::as_tibble() %>% 
  dplyr::rename_with(tolower) %>%
  tibble::rowid_to_column()
pr_specie

# occ vector
occ_spocc_vector <- sf::st_as_sf(occ_spocc, coords = c("longitude",  "latitude"), crs = 4326)
occ_spocc_vector <- occ_spocc_vector[mata_atlantica, ]

# centroid
occ_spocc_vector_cent <- occ_spocc_vector %>% 
  sf::st_union() %>% 
  sf::st_centroid()
occ_spocc_vector_cent

# map
tm_shape(mata_atlantica) +
  tm_polygons() +
  tm_shape(occ_spocc_vector) +
  tm_dots() +
  tm_shape(occ_spocc_vector_cent) +
  tm_bubbles(col = "black")


# var ---------------------------------------------------------------------

# present
var_p <- raster::getData("worldclim", var = "bio", res = 10) %>% 
  raster::crop(mata_atlantica) %>% 
  raster::mask(mata_atlantica) %>% 
  raster::scale()
var_p
names(var_p)

# future
var_f <- raster::getData("CMIP5", var = "bio", res = 10, rcp = 85, model = "AC", year = 70) %>% 
  raster::crop(mata_atlantica) %>% 
  raster::mask(mata_atlantica) %>% 
  raster::scale()
names(var_f) <- names(var_p)
var_f

# map
tm_shape(var_p$bio1) +
  tm_raster(pal = "-Spectral")

tm_shape(var_f$bio1) +
  tm_raster(pal = "-Spectral")

# selecao variaveis
var_p_vif <- usdm::vifstep(x = var_p, th = 2)
var_p_vif

var_p_sel <- usdm::exclude(x = var_p, vif = var_p_vif)
var_p_sel

var_f_sel <- usdm::exclude(x = var_f, vif = var_p_vif)
var_f_sel

# map
tm_shape(var_p_sel$bio2) +
  tm_raster(pal = "-Spectral") +
  tm_shape(occ_spocc_vector) +
  tm_dots()


# models ------------------------------------------------------------------

# fizar a amostragem
set.seed(42)

# pseudo-absence data
pa_specie <- dismo::randomPoints(mask = var_p_sel, n = nrow(pr_specie)) %>% 
  tibble::as_tibble() %>% 
  tibble::rowid_to_column()
pa_specie

# partitioning data ----
pr_train <- pr_specie %>%
  dplyr::select(rowid, longitude, latitude) %>% 
  dplyr::sample_frac(.7)
pr_train

pa_train <- pa_specie %>%
  dplyr::sample_frac(.7)
pa_train

# train and test data
train_pa <- dismo::prepareData(x = var_p_sel,
                               p = pr_train[, -1],
                               b = pa_train[, -1]) %>% 
  tidyr::drop_na()
train_pa
nrow(train_pa)
table(train_pa$pb)

test_pa <- dismo::prepareData(x = var_p_sel,
                              p = dplyr::filter(pr_specie, !rowid %in% pr_train$rowid)[, -1],
                              b = dplyr::filter(pa_specie, !rowid %in% pa_train$rowid)[, -1])
test_pa
nrow(test_pa)
table(test_pa$pb)

# model fitting ----
# random forest
RFR <- randomForest::randomForest(formula = pb ~ ., data = train_pa)
RFR

# evaluation ----
# eval random forest
eval_RFR <- dismo::evaluate(p = test_pa[test_pa$pb == 1, -1],
                            a = test_pa[test_pa$pb == 0, -1],
                            model = RFR)
eval_RFR
plot(eval_RFR, "ROC")

dismo::threshold(eval_RFR, "spec_sens")
id_eval_spec_sens_RFR <- which(eval_RFR@t == dismo::threshold(eval_RFR, "spec_sens"))
tss_spec_sens_RFR <- eval_RFR@TPR[id_eval_spec_sens_RFR] + eval_RFR@TNR[id_eval_spec_sens_RFR] - 1
tss_spec_sens_RFR


# predict ----
# random forest
model_predict_rfr_p <- dismo::predict(var_p_sel, RFR, progress = "text")
model_predict_rfr_p

model_predict_rfr_f <- dismo::predict(var_f_sel, RFR, progress = "text")
model_predict_rfr_f

model_predict_rfr_p_thr <- model_predict_rfr_p >= dismo::threshold(eval_RFR, "spec_sens")
model_predict_rfr_p_thr

model_predict_rfr_f_thr <- model_predict_rfr_f >= dismo::threshold(eval_RFR, "spec_sens")
model_predict_rfr_f_thr

plot(rast(model_predict_rfr_p), col = viridis::turbo(100), 
     main = "Random Forest Presente- Contínuo")
plot(rast(model_predict_rfr_f), col = viridis::turbo(100), 
     main = "Random Forest Futuro - Contínuo")

plot(rast(model_predict_rfr_p_thr), col = c("gray", "blue"), 
     main = "Random Forest Presente - Binário")
plot(rast(model_predict_rfr_f_thr), col = c("gray", "red"), 
            main = "Random Forest Futuro - Binário")

# centroid ----------------------------------------------------------------

# centroides dos rasters
model_predict_rfr_p_thr_val <- raster::rasterToPoints(model_predict_rfr_p_thr) %>% 
  tibble::as_tibble() %>% 
  dplyr::mutate(layer = as.factor(layer))
model_predict_rfr_p_thr_val

model_predict_rfr_p_thr_cent <- model_predict_rfr_p_thr_val %>% 
  dplyr::filter(layer == 1) %>% 
  sf::st_as_sf(coords = c("x", "y"), crs = 4326) %>% 
  sf::st_union() %>% 
  sf::st_centroid()
model_predict_rfr_p_thr_cent

model_predict_rfr_f_thr_val <- raster::rasterToPoints(model_predict_rfr_f_thr) %>% 
  tibble::as_tibble() %>% 
  dplyr::mutate(layer = as.factor(layer))
model_predict_rfr_f_thr_val

model_predict_rfr_f_thr_cent <- model_predict_rfr_f_thr_val %>% 
  dplyr::filter(layer == 1) %>% 
  sf::st_as_sf(coords = c("x", "y"), crs = 4326) %>% 
  sf::st_union() %>% 
  sf::st_centroid()
model_predict_rfr_f_thr_cent

line <- sf::st_as_sf(data.frame(x = c(st_coordinates(model_predict_rfr_p_thr_cent)[1],
                                      st_coordinates(model_predict_rfr_f_thr_cent)[1]),
                                y = c(st_coordinates(model_predict_rfr_p_thr_cent)[2], 
                                      st_coordinates(model_predict_rfr_f_thr_cent)[2])),
                     coords = c("x", "y"), crs = 4326) %>% 
  st_union() %>% 
  st_cast("LINESTRING")
line

tm_shape(mata_atlantica) +
  tm_polygons() +
  tm_shape(model_predict_rfr_p_thr) +
  tm_raster(pal = c(NA, "blue"), alpha = .5, legend.show = FALSE) +
  tm_shape(model_predict_rfr_f_thr) +
  tm_raster(pal = c(NA, "red"), alpha = .5, legend.show = FALSE) +
  tm_shape(occ_spocc_vector) +
  tm_dots() +
  tm_shape(occ_spocc_vector_cent) +
  tm_bubbles(col = "black", size = .5) +
  tm_shape(line) +
  tm_lines(lwd = 4) +
  tm_shape(model_predict_rfr_p_thr_cent) +
  tm_bubbles(col = "blue", size = .5) +
  tm_shape(model_predict_rfr_f_thr_cent) +
  tm_bubbles(col = "red", size = .5)



# wight centroid ------------------------------------------------------------

# values
model_predict_rfr_p_val <- raster::rasterToPoints(model_predict_rfr_p) %>% 
  tibble::as_tibble()
model_predict_rfr_p_val

# centroid
model_predict_rfr_p_wcent <- model_predict_rfr_p_val %>% 
  sf::st_as_sf(coords = c("x", "y"), crs = 4326) %>% 
  sf::as_Spatial() %>% 
  spatialEco::wt.centroid("layer", sp = TRUE) %>% 
  sf::st_as_sf()
model_predict_rfr_p_wcent


model_predict_rfr_f_val <- raster::rasterToPoints(model_predict_rfr_f) %>% 
  tibble::as_tibble()
model_predict_rfr_f_val

model_predict_rfr_f_wcent <- model_predict_rfr_f_val %>% 
  sf::st_as_sf(coords = c("x", "y"), crs = 4326) %>% 
  sf::as_Spatial() %>% 
  spatialEco::wt.centroid("layer", sp = TRUE) %>% 
  sf::st_as_sf()
model_predict_rfr_f_wcent

wline <- sf::st_as_sf(data.frame(x = c(st_coordinates(model_predict_rfr_p_wcent)[1],
                                      st_coordinates(model_predict_rfr_f_wcent)[1]),
                                y = c(st_coordinates(model_predict_rfr_p_wcent)[2], 
                                      st_coordinates(model_predict_rfr_f_wcent)[2])),
                     coords = c("x", "y"), crs = 4326) %>% 
  st_union() %>% 
  st_cast("LINESTRING")
wline

tm_shape(mata_atlantica) +
  tm_polygons() +
  tm_shape(model_predict_rfr_p) +
  tm_raster(pal = "Blues", alpha = .7, legend.show = FALSE) +
  tm_shape(model_predict_rfr_f) +
  tm_raster(pal = "Reds", alpha = .5, legend.show = FALSE) +
  tm_shape(occ_spocc_vector) +
  tm_dots() +
  tm_shape(occ_spocc_vector_cent) +
  tm_bubbles(col = "black", size = .5) +
  tm_shape(wline) +
  tm_lines(lwd = 4) +
  tm_shape(model_predict_rfr_p_wcent) +
  tm_bubbles(col = "blue", size = .5) +
  tm_shape(model_predict_rfr_f_wcent) +
  tm_bubbles(col = "red", size = .5)

# end ---------------------------------------------------------------------
