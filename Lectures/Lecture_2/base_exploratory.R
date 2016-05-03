# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Exploratory analysis with base plotting system --------------

# Read the data
my_data <- iris

# Explore
pairs(my_data)

# the following would do the same thing as my_data is a data frame
# plot(my_data)

# color w.r.t. species
pairs(my_data, col = my_data$Species)

# investigate petal length for each species
boxplot(my_data$Petal.Length ~ my_data$Species)

# play around with some parameters, add titles etc.
boxplot(my_data$Petal.Length ~ my_data$Species,
        las = 1,
        xlab = "Species",
        ylab = "Petal Length",
        main = "Yet another simple example")


# multiple plots
par(mfrow=c(1,2))      # number of rows, number of columns

plot(my_data$Sepal.Length, my_data$Petal.Length,  # x variable, y variable
     col = my_data$Species,                       # colour by species
     main = "Sepal vs Petal Length in Iris")      # plot title

plot(my_data$Sepal.Length, my_data$Sepal.Width,   # x variable, y variable
     col = my_data$Species,                       # colour by species
     main = "Sepal Length vs Width in Iris",      # plot title
     pch = 16,                                    # change data cursor type
     cex = 1.1)                                   # change cursor size

# save plot
pdf('rplot.pdf')
# ------------ plot comes here ---------------
dev.off()
# png('rplot.png')

