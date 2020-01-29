library(tidyverse)
library(rgdal)
library(raster)
library(MAP)
library(mapview)
library(spatialEco)

abies <- "C:/WS1920/QM/week_14/data/abiesalba.csv" %>% 
  read.csv()

soil <- "C:/WS1920/QM/week_14/data/soil_europe_laea_10x10km.tif" %>% 
  stack()
soil_proj <- soil %>% projection()

crs <- "+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"

abies_sp <- 
  SpatialPoints(abies, CRS(crs)) %>% 
  spTransform(abies_sp, CRS(soil_proj))

mapview(abies_sp)

