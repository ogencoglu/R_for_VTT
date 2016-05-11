# R Lecture to VTT - Lecture 4
# Author                : Oguzhan Gencoglu
# Latest Version        : 11.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Time Series Analysis --------------

# exploratory
tsData <- EuStockMarkets[, 1] # ts data
dec <- stl(tsData, s.window = "periodic")
plot(dec)

# de-trend
trModel <- lm(tsData ~ c(1:length(tsData)))
par(mfrow=c(1, 2))
plot(tsData)
plot(resid(trModel), type="l")  # resid(trModel) contains the de-trended series.

# de-seasonalize
library(forecast)
TS <- AirPassengers
dec2 <- stl(TS,"periodic")  # decompose the TS
ts_sa <- seasadj(dec2)  # de-seasonalize
par(mfrow=c(1, 2))
plot(AirPassengers, type="l")  # original series
plot(ts_sa, type="l")  # seasonal adjusted

library(tseries)
adf.test(EuStockMarkets[, 1]) # p-value < 0.05 indicates the TS is stationary
