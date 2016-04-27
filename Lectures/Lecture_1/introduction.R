# R Lecture to VTT - Lecture 1
# Author                : Oguzhan Gencoglu
# Latest Version        : 27.04.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Introduction to basics of R ----------------

# Basic data types and assignment
x <- 5
x
class(x)
x <- 5.22
x <- as.integer(5)

# Complex numbers
sqrt(-5)
sqrt(-5 +0i)
class(sqrt(-5 +0i))

# NaN
y <- 0/0
y

# Vectors
my_vec <- c(7,2,1,4,5)
my_vec
my_vec[6] # NA
my_vec[-3] # drop 3rd element
rev(my_vec) # revers
my_vec <- c(5:9)
my_vec
my_vec * 3.7

my_vec2 <- seq(1,10)
my_vec2
my_vec2 <- seq(from = 1, to = 10)
my_vec2
my_vec2 <- seq(from = 1, to = 20, by = 4)
my_vec2

my_vec3 <- seq(length=14, from=5, by=.2)
my_vec3
length(my_vec3)

sort(my_vec)
sort(my_vec, decreasing=TRUE) # sorting

# Matrices
my_mat <- matrix(c(1,2,3,4,5,6), nrow = 3, ncol = 2)
my_mat
my_mat[1,]
my_mat[2:3,1:2]
t(my_mat)
my_mat2 <- cbind(my_mat, c(7,8,9)) # column bind
my_mat2
rbind(my_mat, c(100,200)) # row bind
c(my_mat)
my_mat2 * my_mat2         # element-wise multiplication
my_mat2 %*%  my_mat2      # matrix multiplication
dim(my_mat2)
dim(my_mat2)[1]
length(my_mat2)

# N-D arrays
my_array <- array(1,20)
my_array
my_array <- array(1:20)
my_array
my_array <- array(c(1:6), c(2,3,5)) # 3D
my_array

# Lists

my_list <- list("Mike", "M", 27)
my_list
my_list <- list(name="Mike", gender="M", 27)
my_list
my_list <- list(2,6,NA,NaN,"abs")
my_list

# Factors - nominal values
# variable with 5 "male" entries and 7 "female" entries 
gender <- c(rep("male",5), rep("female", 7)) 
gender <- factor(gender) 
gender
summary(gender)

# Some ordered nominal variable
rating <- factor(c("medium", "low", "low", "high"))
rating
rating <- ordered(rating, levels = c("low", "medium", "high"))
rating
