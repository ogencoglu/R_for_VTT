# R Lecture to VTT - Lecture 1
# Author                : Oguzhan Gencoglu
# Latest Version        : 27.04.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Control Structures & Functions ----------------

# If, else, for, while
x <- 4

if (x > 5) {
        print(x)
} else {
        print(x**2)
}


for (i in 1:10){
        print(i)
        }

t <- c(2,5,2,6,7)
for (j in t){
        print(j)
}


# Functions
my_func <- function(a = 5, b = 3){
        print (a * b)
        return(a + b)
        }

my_func(10,7)

my_func()
my_func(9)
my_func(,9)
my_func(b=9)

source("control_structures.R")
