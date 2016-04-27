# R Lecture to VTT - Lecture 1
# Author                : Oguzhan Gencoglu
# Latest Version        : 27.04.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Data Wrangling ----------------
# Data aggregation and reshaping
my_data <- ChickWeight
str(my_data)
summary(my_data)
boxplot(my_data$weight)

#find the mean weight depending on diet
#       aggregated thing              -            by what      -  function
aggregate(list(mean_w = my_data$weight), list(diet = my_data$Diet), mean)

# find standard deviation of attributes w.r.t. different diets
aggregate(my_data, list(the_thing_that_i_am_grouping_by = my_data$Diet), sd)

# we could also aggregate on time and diet
aggregate(list(mean_w = my_data$weight),
          list(time = my_data$Time, diet = my_data$Diet),
          mean)

# to see the weights over time across different diets
library(ggplot2)
ggplot(my_data) + geom_line(aes(x=Time, y=weight, colour=Chick)) +
        facet_wrap(~Diet) +
        guides(col=guide_legend(ncol=2))

# Reshape package
id <- c(1,1,2,2)
Time <- c(1,2,1,2)
FatChange <- c(7,3,4,1)
new <- data.frame(id, Time, FatChange)
new$WeightChange <- c(-3,0,-1,2)

library(reshape)
# melt
#       data.frame   columns
md <- melt(new,   c("id", "Time"))

# cast
cast(md, id + Time ~ variable)
cast(md, Time ~ variable, mean)



