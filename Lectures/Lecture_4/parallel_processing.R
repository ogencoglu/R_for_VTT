# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Parallel Processing --------------

# Number of cores
Sys.getenv('NUMBER_OF_PROCESSORS')

max.eig <- function(N, sigma) {
        # This function generates a square matrix of uniformly distributed 
        # random numbers, finds the corresponding (complex) eigenvalues and 
        # then selects the eigenvalue with the largest modulus.
        d <- matrix(rnorm(N**2, sd = sigma), nrow = N)
        E <- eigen(d)$values
        abs(E)[[1]]
}
max.eig(7, 1)

system.time(
        for(n in 1:200) {
                eigs1 <- max.eig(n, 1)
        }
)

system.time(
        eigs2 <- sapply(1:200, function(n) {max.eig(n, 1)})
)

library(foreach)
library(doSNOW)
cluster = makeCluster(8, type = "SOCK")
registerDoSNOW(cluster)
system.time(
        eigs3 <- foreach(n = 1:200) %dopar% max.eig(n, 1)
)