# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Advanced Profiling --------------

# Removing incomplete rows example
fake = matrix(rnorm(200000),10000,20)
fake[fake>2] = NA
f = as.data.frame(fake)

funAgg = function(x) {
        res = NULL
        n = nrow(x)
        
        for (i in 1:n) {
                if (!any(is.na(x[i,]))) res = rbind(res, x[i,])
        }
        res
}

# Call the R code profiler and give it an output file to hold results
Rprof("exampleAgg.out", line.profiling=TRUE)
y1 <- funAgg(f)
Rprof(NULL)
summaryRprof("exampleAgg.out")


funApply = function(x) {
        drop = apply(is.na(x), 1, any)
        x[!drop, ]
}

Rprof("exampleApply.out", line.profiling=TRUE)
y3 = funApply(f)
Rprof(NULL)
summaryRprof("exampleApply.out")



# install profvis package from github repo
devtools::install_github("rstudio/profvis")

library(profvis)

profvis({
        library(ggplot2)
        g <- ggplot(diamonds, aes(carat, price)) + geom_point(size = 1, alpha = 0.2)
        print(g)
})