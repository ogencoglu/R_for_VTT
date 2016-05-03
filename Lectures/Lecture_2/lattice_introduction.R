# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Introduction to lattice plotting system --------------
library(lattice) 

cars <- mtcars

# create factors with value labels 
gear <- factor(cars$gear, levels=c(3,4,5),
               labels=c("3gears","4gears","5gears")) 
cyl <- factor(cars$cyl, levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl")) 

# kernel density plot 
densityplot(~cars$mpg, 
            main="Density Plot", 
            xlab="Miles per Gallon")

# kernel density plots by factor level 
densityplot(~cars$mpg | cyl, 
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

# kernel density plots by factor level (alternate layout) 
densityplot(~cars$mpg | cyl, 
            main="Density Plot by Numer of Cylinders",
            xlab="Miles per Gallon", 
            layout=c(1,3))

# boxplots for each combination of two factors 
bwplot(cyl ~ cars$mpg | gear,
       ylab="Cylinders", xlab="Miles per Gallon", 
       main="Mileage by Cylinders and Gears", 
       layout=(c(1,3)))

# scatterplots for each combination of two factors 
xyplot(cyl ~ cars$mpg | gear, 
       main="Scatter Plot by Number of Gears and Cylinders",
       xlab="Miles Per Gallon")
       
# scatterplots for each combination of two factors 
xyplot(cars$mpg ~ cars$wt | cyl * gear, 
        main="Scatterplots by Cylinders and Gears", 
        ylab="Miles per Gallon", xlab="Car Weight")

# 3d scatterplot by factor level 
cloud(cars$mpg ~ cars$wt * cars$qsec | cyl, 
        main="3D Scatterplot by Cylinders") 
       

      