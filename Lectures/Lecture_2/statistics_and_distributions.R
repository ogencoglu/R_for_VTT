# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Statistics and distributions --------------

# d :	returns the height of the probability density function
# p :	returns the cumulative density function
# q :	returns the inverse cumulative density function (quantiles)
# r :	returns randomly generated numbers

dnorm(0.1)
pnorm(0.4)
qnorm(0.5)
rnorm(50)

dnorm(1, 2, 5)  # Value of normal distribution (mean 2, std 5) at point 1
pnorm(1)        # Cumulative value of normal distribution (unity mean and variance) at point 1

# If there are twelve cars crossing a bridge per minute on average, find the 
# probability of having seventeen or more cars crossing the bridge in a 
# particular minute.
1 - ppois(16, lambda=12)
# OR
ppois(16, lambda=12, lower = FALSE)

# Sampling
sample(seq(5), 50, prob = c(0.3, 0.4, 0.1, 0.1, 0.1), replace = T)

# Common statistical tests

# One Sample t-Test: It is a parametric test used to test if the mean of a 
# sample from a normal distribution could reasonably be a specific value.
set.seed(100)
x <- rnorm(50, mean = 10, sd = 0.5)
t.test(x, mu=10)
# Interpretation: In above case, the p-Value is not less than significance 
# level of 0.05, therefore the null hypothesis that the mean=10 cannot be 
# rejected. Also note that the 95% confidence interval range includes the value 
# 10 within its range.

# Wilcoxon Signed Rank Test: To test the mean of a sample when normal 
# distribution is not assumed
y <- c(20, 29, 24, 19, 20, 22, 28, 23, 19, 19)
wilcox.test(y, mu=28, conf.int = TRUE)
# Interpretation: If p-Value < 0.05, reject the null hypothesis and accept 
# the alternate mentioned in your R code's output.


# Two Sample t-Test: used to compare the mean of 2 Gaussian samples
t.test(x = 1:10, y = 7:20) 
# Interpretation: With p-Value < 0.05, we can safely reject the null hypothesis

# Shapiro Test: To test if a sample follows a normal distribution.
shapiro.test(rnorm(100, mean=5, sd=1))
# Interpretation: The null hypothesis here is that the sample being tested is 
# normally distributed. Since the p Value is not less that the significane 
# level of 0.05, we don't reject the null hypothesis. Therefore, the tested 
# sample is confirmed to follow a normal distribution

# Kolmogorov And Smirnov Test: used to check whether 2 samples follow the same 
# distribution.
ks.test(rnorm(50), runif(40))
# Interpretation: If p-Value < 0.05 (significance level), we reject the null 
# hypothesis that they are drawn from same distribution.

# Fisher's F-Test: used to check if two samples have same variance.
var.test(rnorm(100), runif(50))

# Correlation
cor.test(cars$speed, cars$dist)
# Interpretation: if p < 0.05, reject the null hypothesis (no correlation).