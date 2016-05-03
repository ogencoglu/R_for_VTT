# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Yet another ggplot2 example --------------

# Read the data (temperature in chicago)
nmmaps <- read.csv("chicago-nmmaps.csv", as.is=T)
nmmaps$year <- substring(nmmaps$date, 1, 4) # year
nmmaps$date<-as.Date(nmmaps$date)
nmmaps <- nmmaps[nmmaps$date>as.Date("1996-12-31"),] # subset
nmmaps$season <- as.factor(nmmaps$season) # change to factor


# simple stuff
library(ggplot2)
g1 <- ggplot(nmmaps, aes(date, temp)) + geom_point(color = "firebrick")
g1

g2 <- ggplot(nmmaps, aes(date, temp, color = season)) + geom_point()
g2

# facet plot
g3 <- ggplot(nmmaps, aes(date,temp)) + geom_point(color="aquamarine4") + facet_wrap(~year, nrow=1)
g3

# facet plot
g4 <- ggplot(nmmaps, aes(date,temp)) + geom_point(color="chartreuse4") + facet_wrap(~year, ncol=2)
g4

# box plots
g5 <- ggplot(nmmaps, aes(x=season, y=o3)) + geom_boxplot(fill="chartreuse4") + coord_flip()
g5

g6 <- g5 + geom_jitter(alpha=0.5, aes(color=season), position = position_jitter(width = .2))
g6
