# Script to plot map of the Gulf of St. Lawrence

library(tidyverse)
library(ggOceanMaps)
library(ggspatial)

LC <- data.frame(lon=-58.25, lat=46.5)
Estuary <- data.frame(lon=-67.25, lat=49.2)
GSL <- data.frame(lon=-62, lat=48.5)

basemap(limits = c(-70, -55, 45.5, 52), bathy.style = "rcb", rotate = TRUE) +
  ggspatial::geom_spatial_text(data = LC, aes(x = lon, y = lat, label = "Laurentian Channel"), angle = -50, color = "black") +
  ggspatial::geom_spatial_text(data = Estuary, aes(x = lon, y = lat, label = "St. Lawrence Estuary"), angle = 20, color = "black") +
  ggspatial::geom_spatial_text(data = GSL, aes(x = lon, y = lat, label = "Gulf of St. Lawrence"), angle = 0, color = "black")

#ggsave("GSL_map_ggOcean.jpg", width = 7, height = 6, units = "in", scale = 1.1, dpi = 1200)
