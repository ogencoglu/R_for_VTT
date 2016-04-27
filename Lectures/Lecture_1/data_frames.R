# R Lecture to VTT - Lecture 1
# Author                : Oguzhan Gencoglu
# Latest Version        : 27.04.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Data Frames ----------------

name <- c("Jenni", "Harri", "Mikko") 
age <- c(20, 25, 30) 
student <- c(TRUE, FALSE, TRUE) # class logical
df <- data.frame(name, age, student)  
df
# access an attribute by using $ notation

A <- matrix( 
        c(9, 2, 3, 4, 5, 6),    # the data element
        nrow = 2,               # number of rows
        ncol = 3,               # number of columns
        byrow = TRUE)           # fill matrix by rows
A <- as.data.frame(A) # as.XXXX is a common pattern in R
colnames(A) <- c("apples", "bananas", "oranges")
rownames(A) <- c("Hannu", "Ouz")
A$bananas # access a column
A["Ouz",] # access a row

# remove cols or rows
B <- A[-2,]
A$bananas      <- NULL


# Examine mtcars dataset
my_data <- mtcars
head(mtcars)
nrow(my_data) # number of rows
ncol(my_data) # number of columns

# Actual handy parts of R starts here
my_data["Mazda RX4", "cyl"]
my_data[my_data$cyl==4,] # masking
my_data[my_data$qsec < 17 & my_data$gear == 5,]
my_data[my_data$qsec < 17 & my_data$gear == 5,]$mpg

# dealing with duplicates
test <- read.table(header=TRUE, text='
 label value
 A     4
 B     3
 C     6
 B     3
 B     1
 A     2
 A     4
 A     4
')

# checking duplicates
duplicated(test)
test[duplicated(test),] # show repeating entries
test <- test[!duplicated(test),] # same thing as unique(test)
unique(test[duplicated(test),]) # Show unique repeat entries

