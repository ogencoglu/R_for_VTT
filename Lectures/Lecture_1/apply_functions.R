# R Lecture to VTT - Lecture 1
# Author                : Oguzhan Gencoglu
# Latest Version        : 27.04.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Apply Functions ----------------

# lapply
my_list <- list(a = 1:5, b = rnorm(20))
lapply(my_list, mean)

my_list2 <- 1:5
lapply(my_list2, runif)
lapply(my_list2, runif, min = 3, max = 7)

my_list3 <- list( a = matrix(1:4, 2, 2), b = matrix(1:6, 3, 2))
lapply(my_list3, function(my_func) my_func[,2])

# sapply simplifies the result

# tapply is used to apply a function to a subset of the input
my_list4 <- c(rnorm(10), runif(10), rnorm(10))
index <- gl(3,10)
tapply(my_list4, index, mean)
tapply(my_list4, index, range)

result <- lapply(split(my_list4, index), mean)
result