# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Feature Selection --------------

dat <- read.csv("http://rstatistics.net/wp-content/uploads/2015/09/ozone1.csv", stringsAsFactors=F)

# Ensemble learners - random forest
library(party)
cf1 <- cforest(ozone_reading ~ . , data= dat, control=cforest_unbiased(mtry=2,ntree=50)) # fit the random forest
varimp(cf1) # based on mean decrease in accuracy
varimp(cf1, conditional=TRUE) # adjusts for correlations between predictors
varimpAUC(cf1) # more robust towards class imbalance.

# generalized cross validation 
library(earth)
marsModel <- earth(ozone_reading ~ ., data=dat) # build model
v <- evimp(marsModel) # estimate variable importance
v
