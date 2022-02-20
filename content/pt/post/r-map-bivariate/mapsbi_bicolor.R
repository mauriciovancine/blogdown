require(classInt)
require(data.table)
require(ggplot2)
require(raster)
library(biscale)
library(cowplot)
library(patchwork)

source("https://gist.githubusercontent.com/scbrown86/2779137a9378df7b60afd23e0c45c188/raw/1c9046f8aaf2387083930522d0590b6c68bb3ed2/bivarRasterPlot.R")

# get some data
ra_am <- raster::raster("amphibians.grd")
ra_re <- raster::raster("reptiles.grd")

# Define the number of breaks
nBreaks <- 10

# my method
# Create the colour matrix
col.matrixQ <- colmat(nbreaks = nBreaks, breakstyle = "quantile",
                      xlab = "Temperature", ylab = "Precipiation", 
                      bottomright = "yellow", upperright = "#820050",
                      bottomleft = "gray", upperleft = "#0096eb",
                      saveLeg = FALSE, plotLeg = TRUE)

# create the bivariate raster
bivmapQ <- bivariate.map(rasterx = ra_am, rastery = ra_re,
                         export.colour.matrix = FALSE,
                         colourmatrix = col.matrixQ)

# Convert to dataframe for plotting with ggplot
bivMapDFQ <- setDT(as.data.frame(bivmapQ, xy = TRUE))

# Make the map using ggplot
map_q <- ggplot(bivMapDFQ, aes(x = x, y = y)) +
  geom_raster(aes(fill = layer)) +
  scale_y_continuous(breaks = seq(-20, 60, by = 10), 
                     labels = paste0(seq(-20, 60, 10), "°")) +
  scale_x_continuous(breaks = seq(50,175,25), 
                     labels = paste0(seq(50,175,25), "°")) +
  scale_fill_gradientn(colours = col.matrixQ, na.value = "transparent") + 
  theme_bw() +
  theme(text = element_text(size = 10, colour = "black")) +
  coord_quickmap(expand = FALSE) +
  theme(legend.position = "none",
        plot.background = element_blank(),
        strip.text = element_text(size = 12, colour = "black"),
        axis.text.y = element_text(angle = 90, hjust = 0.5),
        axis.text = element_text(size = 12, colour = "black"),
        axis.title = element_text(size = 12, colour = "black")) +
  labs(x = "Longitude", y = "Latitude")
map_q

myPlot <- cowplot::ggdraw() +
  cowplot::draw_plot(map_q, 0, 0, 1, 1) +
  cowplot::draw_plot(BivLegend, 0.075, .3, 0.2, 0.2)
myPlot




# bi_scale method
bi <- biscale::bi_class(dat, x = "Temp", y = "Prec",
                        style = "fisher", dim = 3)
map_bi <- ggplot(bi) +
  geom_tile(aes(x, y, fill = bi_class), show.legend = FALSE) +
  bi_scale_fill(pal = "DkViolet") +
  theme_bw() +
  borders(colour = "black", size = 0.5) +
  coord_quickmap(expand = FALSE, xlim = clipExt[1:2], ylim = clipExt[3:4]) +
  scale_y_continuous(breaks = seq(-20, 60, by = 10), 
                     labels = paste0(seq(-20, 60, 10), "°")) +
  scale_x_continuous(breaks = seq(50,175,25), 
                     labels = paste0(seq(50,175,25), "°")) +
  theme(legend.position = "none",
        plot.background = element_blank(),
        strip.text = element_text(size = 12, colour = "black"),
        axis.text.y = element_text(angle = 90, hjust = 0.5),
        axis.text = element_text(size = 12, colour = "black"),
        axis.title = element_text(size = 12, colour = "black")) +
  labs(x = "Longitude", y = "Latitude")
map_bi

bi_leg <- bi_legend(pal = "DkViolet",
                    dim = 3,
                    xlab = "Temperature ",
                    ylab = "Precipitation ",
                    size = 8)
biPlot <- cowplot::ggdraw() +
  cowplot::draw_plot(map_bi, 0, 0, 1, 1) +
  cowplot::draw_plot(bi_leg, 0.075, .3, 0.2, 0.2)
biPlot

patchwork::wrap_plots(map_q, map_bi, ncol = 1)
