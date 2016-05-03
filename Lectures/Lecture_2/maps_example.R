# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Plotting maps with R --------------

# Read airports data (source: http://openflights.org/data.html)
airports <- read.csv("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat", header = FALSE)

# assign some column names
colnames(airports) <- c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")

# take a look ta the data
head(airports)

# Plot on map
library(rworldmap)
newmap <- getMap(resolution = "high")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)
points(airports$lon, airports$lat, col = "red", pch = 16, cex = .6)
