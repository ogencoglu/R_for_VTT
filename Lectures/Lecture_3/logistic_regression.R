# R Lecture to VTT - Lecture 3
# Author                : Oguzhan Gencoglu
# Latest Version        : 04.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Logistic regression --------------

# read the graduate school admission data
my_data <- read.csv("http://www.ats.ucla.edu/stat/data/binary.csv")

# convert rank to a categorical variable
my_data$rank <- factor(my_data$rank)

# train a logistic regression
log_reg <- glm(admit ~ gre + gpa + rank, data = my_data)
summary(log_reg)

# get confidence intervals
conf_int <- exp(cbind(OR = coef(log_reg), confint(log_reg)))

# predict the probability of admission for each rank by fixing the other 
# variables to their means and so on
newdata1 <- with(my_data, data.frame(gre = mean(gre), gpa = mean(gpa), 
                                                        rank = factor(1:4)))
newdata2 <- with(my_data, data.frame(gre = rep(seq(from = 200, to = 800, 
                                                        length.out = 100), 4), 
                        gpa = mean(gpa), rank = factor(rep(1:4, each = 100))))
newdata3 <- cbind(newdata2, predict(log_reg, newdata = newdata2, type = "link",
                                                                   se = TRUE))
# z-score of 0.95 area is around 1.96
newdata3 <- within(newdata3, {
        PredictedProb <- plogis(fit)
        LL <- plogis(fit - (1.96 * se.fit))     
        UL <- plogis(fit + (1.96 * se.fit))
})

# plot predicted probabilities and %95 confidence intervals
library(ggplot2)
ggplot(newdata3, aes(x = gre, y = PredictedProb)) + geom_ribbon(aes(ymin = LL,
ymax = UL, fill = rank), alpha = 0.2) + geom_line(aes(colour = rank), size = 1)
