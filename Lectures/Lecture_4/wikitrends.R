# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Wikitrends --------------

library(wikipediatrend)

# Fetch page view data
wp <- wp_trend(page = c("Ukraina", "Vladimir Putin"), 
                   from = "2013-11-01", 
                   to   = "2014-06-01", 
                   lang = "fi")
cor.test(wp[wp$title=="Ukraina",]$count, wp[wp$title=="Vladimir_Putin",]$count)

# plot
library(ggplot2)
p <- ggplot(wp, aes(x=date, y=count, color=title)) + geom_line()
p 
