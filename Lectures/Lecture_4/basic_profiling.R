# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Basic Profiling --------------

# create some fake data
m <- 50000 # 50000
n <- 50
X <- matrix(rnorm(m * n, mean = 10, sd = 3), nrow = m)
grp <- rep(1:2, each = n / 2)


# basic profiling
t2 <- rep(NULL, m)
system.time(
for(i in 1:m) {
        t2[i] <- t.test(X[i, grp == 1], X[i, grp == 2])$stat
}
)
# Interpretation: 
# user time: time charged to the CPU(s) for this expression
# elapsed time: "wall clock" time
# Elapsed time may be greater than user time: CPU spends a lot of time waiting around
# Elapsed time may be smaller than the user time: multicore processing

#system.time(vtt <- readLines("https://github.com/ogencoglu/R_for_VTT"))

# apply
compT <- function(x, grp){
        t.test(x[grp == 1], x[grp == 2])$stat
}
system.time(t1 <- apply(X, 1, compT, grp = grp)) # 1 indicates rows

