library(sf)
library(leaflet)
library(mapview)
library(tidyverse)
library(readr)
library(tidyr)
library(dplyr)
library(ggplot2)


starbucks <- read_csv("https://raw.githubusercontent.com/libjohn/mapping-with-R/master/data/All_Starbucks_Locations_in_the_US_-_Map.csv")

glimpse(starbucks)

starbucksstate <- starbucks  %>% 
    filter(State == c("NY","FL","CA"))

starbucksstate

mapview(starbucksstate, xcol = "Longitude", ycol = "Latitude", crs = 4269, grid = FALSE)


lon <- c(19.2381, 18.9322, 18.5438)
lat <- c(72.8523, 72.8264, 73.7778)

map.data <- data.frame(lon, lat)

mapview(map.data, xcol = "lat", ycol = "lon", crs = 4269, grid = FALSE)
