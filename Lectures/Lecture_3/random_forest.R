# R Lecture to VTT - Lecture 3
# Author                : Oguzhan Gencoglu
# Latest Version        : 04.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Random forest --------------

library(rpart)
# Load dataset of children who have had corrective spinal surgery
some_data <- kyphosis
# Kyphosis: indicating if a kyphosis (a type of deformation) was present 
# after the operation
# Age: age in months
# Number: the number of vertebrae involved
# Start: the number of the first (topmost) vertebra operated on.

# train a RF
library(randomForest)
fit <- randomForest(Kyphosis ~ Age + Number + Start,  data = kyphosis,
                    ntree = 100)

# print results
print(fit)

# importance of each feature
importance(fit)

