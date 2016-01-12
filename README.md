# Map of different types of emergency locations in Toronto

This is a map of different types of emergency locations in Toronto, in R.

# Warning: this program must not be used in emergency locations when a life must be saved

**This program must not be used in emergency locations when a life must be saved**. This program
may not give the precise information necesary to find emergency locations in this situation where
every second matters, this program might execute slowly in these urgent situations or might not
finish to execute in these situations at all, and even then, the location shown in the map by this
program may not be available at this critical emergency, losing precious time, for the data this
program uses from the Open Data of the City of Toronto may not be updated real-time when an
emergency location happens to be congested or unavailable. (Besides, the handling of an emergency
usually requires a logistic involving different types of public services, not only one, made
available as soon as possible at the place of the emergency.)

# WIP

This project is a *work in progress*. The implementation is *incomplete* and subject to change.
The documentation can be inaccurate.

# Requirements

Besides R and network connectivity, this program requires the `wget` program (it can be done also with `curl`),
`unzip` command-line, and the `ogr2ogr` command-line tool. This last program can be installed from the `gdal`
rpm package (RedHat) or `gdal-bin` (Debian) or `gdal` (brew in Mac OS/X):

        dnf install gdal

        apt-get install gdal

        brew install gdal

(These belong to the Geospatial Data Abstraction Library)

This program downloads and uses ESRI shapefiles made available by the City of Toronto.

# Example of the map generated
 
![sample of the map of emergency locations in Toronto](/toronto_emergency_locations.png?raw=true "sample of the map of emergency locations in Toronto")


