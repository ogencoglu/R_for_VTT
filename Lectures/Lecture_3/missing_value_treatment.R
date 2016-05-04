# R Lecture to VTT - Lecture 3
# Author                : Oguzhan Gencoglu
# Latest Version        : 04.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Missing value treatment --------------

# Some background:
# MCAR, MAR, MNAR

# read Boston housing data
bh <- read.csv('housing_with_missings.csv')
original <- read.csv('housing_original.csv')
actuals <- original$ptratio[is.na(bh$ptratio)]

# some values from 'rad' and 'ptratio' are missing
nrow(bh)
sum(complete.cases(bh))

# if your classes are sufficiently present in your data, deleting
# is a safer choice (it will have a insignificant effect on prediction)
lm(medv ~ ptratio + rad, data=bh, na.action=na.omit)
lm(medv ~ ptratio + rad, data=original, na.action=na.omit)

# mean/median imputation
library(Hmisc)
impute(bh$ptratio, mean)  # replace with mean
impute(bh$ptratio, median)  # median
impute(bh$ptratio, 20)  # replace specific number
predicteds <- rep(mean(bh$ptratio, na.rm=T), length(actuals))
regr.eval(actuals, predicteds)

# kNN imputation
library(DMwR)
knnOutput <- knnImputation(bh[, !names(bh) %in% "medv"])  # get rid of targets
anyNA(knnOutput)
predicteds <- knnOutput[is.na(bh$ptratio), "ptratio"]
regr.eval(actuals, predicteds)
# not optimal for factor variables

# recursive partitioning and regression trees
library(rpart)
class_mod <- rpart(rad ~ . - medv, data=bh[!is.na(bh$rad), ], method="class", na.action=na.omit)  # since rad is a factor
anova_mod <- rpart(ptratio ~ . - medv, data=bh[!is.na(bh$ptratio), ], method="anova", na.action=na.omit)  # since ptratio is numeric.
predicteds <- predict(anova_mod, bh[is.na(bh$ptratio), ])
regr.eval(actuals, predicteds)

# Multivariate Imputation by Chained Equations 
library(mice)
miceMod <- mice(bh[, !names(bh) %in% "medv"], method="rf")  # perform mice imputation, based on random forests.
miceOutput <- complete(miceMod)  # generate the completed data.
anyNA(miceOutput)
predicteds <- miceOutput[is.na(bh$ptratio), "ptratio"]
regr.eval(actuals, predicteds)
