#!/bin/sh

mkdir ./data
cd ./data

# Download the Police Facility Locations
# http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=4071790e6f21d210VgnVCM1000003dd60f89RCRD

wget -O Police_Facilities_WGS84.zip http://www1.toronto.ca/City_Of_Toronto/Information_Technology/Open_Data/Data_Sets/Assets/Files/Police_Facilities_WGS84_latitude_longitude.zip
unzip -o Police_Facilities_WGS84.zip


# Download the Automatic External Defribilators (needs this cleaning before using it in R)
# http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=6455da18d9f44410VgnVCM10000071d60f89RCRD

wget -O AED_wgs84.zip  http://opendata.toronto.ca/gcc/AED_wgs84.zip
unzip -o AED_wgs84.zip

ogr2ogr -where "OGR_GEOMETRY='Point'" -f "ESRI Shapefile"  toronto_aedefibrilators_wgs84.shp  AED_WGS84.shp


# Download the Ambulance Station Locations (needs this cleaning before using it in R)
# http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=93f91c98d2b6d310VgnVCM10000071d60f89RCRD&vgnextchannel=1a66e03bb8d1e310VgnVCM10000071d60f89RCRD

wget -O ambulance_facility_wgs84.zip http://opendata.toronto.ca/gcc/ambulance_facility_wgs84.zip
unzip -o ambulance_facility_wgs84.zip

ogr2ogr -where "OGR_GEOMETRY='Point'" -f "ESRI Shapefile"  toronto_ambulance_facility_wgs84.shp  AMBULANCE_FACILITY_WGS84.shp
