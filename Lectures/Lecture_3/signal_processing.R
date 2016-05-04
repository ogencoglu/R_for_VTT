# R Lecture to VTT - Lecture 3
# Author                : Oguzhan Gencoglu
# Latest Version        : 04.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Signal processing --------------

plot_spect <- function(X.k, xlimits=c(0,length(X.k))) {
        plot.data  <- cbind(0:(length(X.k)-1), Mod(X.k))
        
        plot.data[2:length(X.k),2] <- 2*plot.data[2:length(X.k),2] 
        
        plot(plot.data, t="h", lwd=2, main="", 
             xlab="Frequency (Hz)", ylab="Strength", 
             xlim=xlimits, ylim=c(0,max(Mod(plot.data[,2]))))
}

library(signal)

# read ECG data
ecg  <- ts(unlist(read.csv("ecg.csv")))
ecg  <- ( ecg - mean(ecg) ) / sd(ecg) # normalize
plot_spect(fft(as.numeric(ecg)), xlimits=c(0,30))

# Filter H(z)
B1 <- c(0.2066,0.4131,0.2066)	# Coefficients of numerator polynomial
A1 <- c(1,-0.3695,0.1958)       # Coefficients of denominator polynomial
Hz <- freqz(B1,A1,100)		# Compute the transfer function
plot(Hz)
# plot(Hz$f,abs(Hz$h))

# Filter
ch <- cheby2(7, 20, 0.2, type = 'low') # filter order, dB of pass band ripple, critical freq
filtered <- filter(ch, ecg)

plot(ecg)
plot(ecg - filtered)





