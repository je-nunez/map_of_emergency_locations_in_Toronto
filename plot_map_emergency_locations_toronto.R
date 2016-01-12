options(echo=FALSE)

# load the required libraries

required_packages <- c("plyr", "ggplot2", "sp", "rgeos", "maptools", "ggmap", "rgdal")

missing_packages <- required_packages[!(required_packages %in% installed.packages()[,"Package"])]
if( 0 < length(missing_packages) ) {
  options(repos=c(CRAN="http://cran.cnr.Berkeley.edu/"))
  install.packages(missing_packages, dep=TRUE)
}

library(plyr)
library(sp)
library(rgeos)
library(ggplot2)
library(maptools)
library(ggmap)
library(rgdal)

# Different paths of the shapefiles of emergency locations, e.g., for the
# police facilities, automatic cardiac defibrilators, etc.
# This recalls a little the New York City's Department of Civic Planning's
# LION Single-segment street database, in which one single shapefile (LION)
# has different types of features (one-direction street segments, bike lanes,
# elevated ramps, etc). Here is different shapefiles for different types of 
# emergency locations (police, ambulance, cardiac defibrilators, etc).
# Although, to be fair, the different types of street segments are in one
# single shapefile because they are related, and in our case, these different
# emergency locations don't need to be related, e.g., a police facility doesn't
# need to be related with a ambulance location or with a cooling center.

path.police_facilities <- '<PUT-HERE-THE-DIRECTORY-PATH-TO>/data/Toronto_Police_Facilities_WGS84.shp'

path.aed_defibrillators_shp <- '<PUT-HERE-THE-DIRECTORY-PATH-TO>/data/toronto_aedefibrilators_wgs84.shp'

path.ambulance_locations <- '<PUT-HERE-THE-DIRECTORY-PATH-TO>/data/toronto_ambulance_facility_wgs84.shp'

# A helper function: read a shapefile given its filename and 
# fortify its features

custom_read_shp_and_fortify_df <- function(shapefile_fname) {
  shp <- readShapeSpatial(shapefile_fname)
  fortify(as.data.frame(shp))
}

# read the shapefiles about different Emergency Locations in Toronto.

police_facilities <- custom_read_shp_and_fortify_df(path.police_facilities)
aed_defibrillators <- custom_read_shp_and_fortify_df(path.aed_defibrillators_shp)
ambulance_locations <- custom_read_shp_and_fortify_df(path.ambulance_locations)

# start plotting

zoom_level <- 11

toronto_borders <- c(-79.63, 43.57, -79.22, 43.825)

city_background <- get_map(location = toronto_borders,
                           color = "color",
                           source = "osm",
                           maptype = "hybrid",
                           zoom = zoom_level)

png("/tmp/toronto_emergency_locations.png",
    width=1200, height=760)

# the different point sizes we use for different type of
# emergency location.

point_size.police <- 4
point_size.ambulance <- 4
point_size.defibrilator <- 6

ggmap(city_background) +
  geom_point(aes(x = coords.x1,
                 y = coords.x2,
                 shape = 17),
             data = police_facilities,
             size = point_size.police,
             color = "Red",
             fill = "Red",
             alpha = 1.0) +
  scale_shape_identity() +
  geom_point(aes(x = coords.x1,
                 y = coords.x2,
                 shape = 20),
             data = ambulance_locations,
             size = point_size.ambulance,
             color = "Yellow",
             fill = "Yellow",
             alpha = 1.0) +
  geom_point(aes(x = coords.x1,
                 y = coords.x2,
                 shape = 42),
             data = aed_defibrillators,
             size = point_size.defibrilator,
             color = "Blue",
             fill = "Blue",
             alpha = 1.0) +
  labs(x = "Longitude",
       y = "Latitude",
       title = "Emergency Locations in the City of Toronto")

dev.off()
