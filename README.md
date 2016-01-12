# Map of different types of emergency locations in Toronto

This is a map of different types of emergency locations in Toronto, in R.

# WARNING before use

**This program must not be used in emergency situations where a life must be saved**.

This program may not give the precise information necesary to find emergency locations in the
situation when a life must be saved, where every second matters. This program might execute
slowly in these urgent situations or might not finish to execute in these situations at all,
and even then, the locations shown in the map by this program may not be available at this
critical emergency, losing precious time, for the data this program uses from the Open Data
of the City of Toronto may not be updated real-time when an emergency location happens to be
congested or unavailable. (Besides, the handling of an emergency usually requires a logistic
involving different types of public services, not only one, made available as soon as possible
at the place of the emergency. To coordinate this logistic urgently, the intervention of an
expert human agent is obligatory. This program is **not** related nor interacts with 9-1-1
infrastructures.)

# WIP

This project is a *work in progress*. The implementation is *incomplete* and subject to change.
The documentation can be inaccurate.

# Emergency locations represented on the Map

This program downloads and uses several ESRI shapefiles made available by the Open Data
initiative of the City of Toronto.

So far, the following shapefiles are used:

[Police Facilities] (http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=4071790e6f21d210VgnVCM1000003dd60f89RCRD)

[Ambulance Station Locations] (http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=93f91c98d2b6d310VgnVCM10000071d60f89RCRD&vgnextchannel=1a66e03bb8d1e310VgnVCM10000071d60f89RCRD)

[Automatic External Defibrillators] (http://www1.toronto.ca/wps/portal/contentonly?vgnextoid=6455da18d9f44410VgnVCM10000071d60f89RCRD)

# Requirements

Besides `R` and network connectivity, this program requires the `wget` program (it can be done also with `curl`),
the `unzip` command-line tool, and the `ogr2ogr` command-line tool. This last program can be installed from the
`gdal` rpm package (RedHat) or `gdal-bin` (Debian) or `gdal` (brew in Mac OS/X):

        dnf install gdal

        apt-get install gdal

        brew install gdal

(These belong to the Geospatial Data Abstraction Library)

# Example of the map generated
 
![sample of the map of emergency locations in Toronto](/toronto_emergency_locations.png?raw=true "sample of the map of emergency locations in Toronto")


