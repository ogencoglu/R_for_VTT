# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Even more data wrangling --------------

# read data
library(ggplot2)
library(nycflights13)
library(dplyr)
flights <- flights
dim(flights)
head(flights)

# filter
filter(flights, month == 1, day == 1)
# NOTE: equivalent to flights[flights$month == 1 & flights$day == 1, ]
head(filter(flights, month == 1 | month == 2))

# arrange
arr <- arrange(flights, desc(arr_delay))
# NOTE: equivalent to flights[order(desc(flights$arr_delay)), ]

# select
# Select all columns between year and day (inclusive)
select(flights, year:day)
# Select all columns except those from year to day (inclusive)
select(flights, -(year:day))

# mutate
mt <- mutate(flights, gain = arr_delay - dep_delay, speed = distance / air_time * 60)

# sampling
sample_n(flights, 10)
sample_frac(flights, 0.01)

# grouping
delay <- summarise(group_by(flights, tailnum),
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE))
delay <- filter(delay, count > 20, dist < 2000)

# Relation between average distance and average delay is interesting
ggplot(delay, aes(dist, delay)) +
        geom_point(aes(size = count), alpha = 1/2) +
        geom_smooth() +
        scale_size_area()
