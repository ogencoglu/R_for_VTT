# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Apply Functions ----------------

# lapply
my_list <- list(a = 1:5, b = rnorm(20))
lapply(my_list, mean)

my_list2 <- 1:5
lapply(my_list2, runif)
lapply(my_list2, runif, min = 3, max = 7)

# sapply simplifies the result

# tapply is used to apply a function to a subset of the input
my_list3 <- c(rnorm(10), runif(10), rnorm(10))
index <- gl(3,10) # generate factor levels
tapply(my_list3, index, mean)
tapply(my_list3, index, range)
