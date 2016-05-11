# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Parallel Processing 2 --------------

# doSNOW loads already parallel and snow
library(doSNOW)

# needed for calculating SHA-256
library(digest)
hashing <- function(v) {
        df <- data.frame("i" = v, "sha256" = NA)
        for(i in v) {
                df[i-v[1]+1,"sha256"] <- digest(as.character(i), algo="sha256")
        }
        df
}

# number of cycles to be taken care of within the function
M <- c(10,50,500,5000)

# number of cores to use
C <- c(2,8)

# all combinations of M and C
bm <- expand.grid(M,C)
names(bm) <- c("m","c")
bm$elapsed <- NA


for(c in C) {
        # number of cores to be used
        cl <- makeCluster(c)
        
        # make cluster of cores available
        registerDoSNOW(cl)
        
        for(m in M) {
                # number of times the function shall be executed
                n <- 100000/m
                s <- system.time(
                        result <- foreach(i=1:n, .packages="digest", 
                                          .combine="rbind", .inorder=FALSE) 
                        %dopar% hashing(((i-1)*m+1):(i*m))
                )
                
                # stores and prints the benchmark
                bm[bm$m==m & bm$c==c,"elapsed"] <- s["elapsed"]
                print(paste(c,m,bm[bm$m==m & bm$c==c,"elapsed"],nrow(result)))
        }
        
        # free the cores
        stopCluster(cl)
}


# executing the calculation serially
s <- system.time(result <- hashing(1:100000))
