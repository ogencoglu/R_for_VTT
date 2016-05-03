# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Lattice plotting system example --------------

# Load the Fiji earthquakes data
eq <- quakes
names(quakes)

# load lattice
library(lattice)
magnitude <- equal.count(eq$mag, number=2, overlap=0)
depthgroup <- equal.count(eq$depth, number=3, overlap=0)

xyplot(lat ~ long | depthgroup * magnitude,
       data = eq,
       main = "Fiji Earthquakes",
       ylab = "latitude", xlab="longitude",
       pch = ".",
       cex = 3.4,
       scales = list(x = list(alternating = c(1, 1, 1))),
       between = list(y = 1),
       par.strip.text = list(cex=0.7),
       par.settings = list(axis.text = list(cex = 0.7)))