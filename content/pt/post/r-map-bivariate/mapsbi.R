library(tidyverse)
library(biscale)
library(cowplot)
library(raster)


# vector ------------------------------------------------------------------

data <- bi_class(stl_race_income, x = pctWhite, y = medInc, style = "quantile", dim = 3)
data

map <- ggplot() +
  geom_sf(data = data, mapping = aes(fill = bi_class), color = "white", size = 0.1, show.legend = FALSE) +
  bi_scale_fill(pal = "DkBlue", dim = 3) +
  labs(
    title = "Race and Income in St. Louis, MO",
    subtitle = "Dark Blue (DkBlue) Palette"
  ) +
  bi_theme()
map

legend <- bi_legend(pal = "DkBlue",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 8)
legend

finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0.2, .65, 0.2, 0.2)
finalPlot


# raster ------------------------------------------------------------------

r1 <- raster(volcano)
plot(r1)

r2 <- r1
r2[] <- rnorm(ncell(r1))
plot(r2)

da <- raster::rasterToPoints(r1) %>% 
  tibble::as_tibble() %>% 
  dplyr::rename(r1 = 3) %>% 
  dplyr::bind_cols(r2 = na.omit(r2[]))
da

data <- bi_class(da, x = r1, y = r2, style = "quantile", dim = 3)
data$bi_class %>% unique()

custom_pal <- bi_pal_manual(val_1_1 = "#f3f3f3", val_1_2 = "#f6e4b7", val_1_3 = "#feae3b",
                            val_2_1 = "#abd3df", val_2_2 = "#93886e", val_2_3 = "#bd6223", 
                            val_3_1 = "#319ebe", val_3_2 = "#2a6483", val_3_3 = "#000000")

bi_legend(pal = custom_pal,
          dim = 3,
          xlab = "X",
          ylab = "Y",
          size = 8)

map <- ggplot() +
  geom_raster(data = data, mapping = aes(x = x, y = y, fill = bi_class), 
              show.legend = FALSE) +
bi_scale_fill(pal = "DkViolet", dim = 3) +
  coord_fixed() +
  labs(x = "", y = "") +
  theme_bw()
map

legend <- bi_legend(pal = "DkViolet",
                    dim = 3,
                    xlab = "Higher % White ",
                    ylab = "Higher Income ",
                    size = 8)
legend

finalPlot <- ggdraw() +
  draw_plot(map, 0, 0, 1, 1) +
  draw_plot(legend, 0, .65, .3, .3)
finalPlot
