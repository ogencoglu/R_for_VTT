# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Reading & Writing Data ----------------

# Read an Excel file
library(xlsx)
dat <- read.xlsx("ACS.xlsx", sheetName = "Income", header = TRUE)

dat_sub <- read.xlsx("ACS.xlsx", sheetName="Income", header=TRUE,
                     colIndex=c(1,3), rowIndex=seq(30,130))

# read csv file
dat2 <- read.csv("ACS.csv", header = TRUE)

# read.table("ACS.txt", sep="\t")

# exporting to excel format
write.xlsx(dat_sub, "ACS_sub.xlsx")

# exportin to csv
write.csv(dat_sub, "ACS_sub.csv")

# save the entire R session
save(list = ls(), file = "all.Rdata")
save(list = c(dat, dat2), file = "subset.Rdata")

# load R session
load("all.Rdata")

