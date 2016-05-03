# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Introduction to ggplot2 graphing system --------------

# get the data, i.e., sample of 20 clusters of galaxies with Chandra X-ray data
dir <- "http://www.sr.bham.ac.uk/~ajrs/papers/sanderson06"
CC <- read.table(paste(dir, "mean_Tprofile-CC.txt", sep="/"), header=TRUE)
nCC <- read.table(paste(dir, "mean_Tprofile-nCC.txt", sep="/"), header=TRUE)

# Combine datasets into a single data frame:
CC$type <- "Cool core"
nCC$type <- "Non-cool core"
tidy_data <- rbind(CC, nCC)


require(ggplot2)
# Define axis labels:
xlabel <- as.expression(expression( paste("Radius (", R[500], ")") ))
ylabel <- "Scaled Temperature"
# define main plot
p <- ggplot(data = tidy_data, aes(x=r.r500, y=sckT, ymin=sckT.lo, ymax=sckT.up, fill=type, linetype=type))
p <- p +     geom_line() 
p <- p +     geom_ribbon(alpha = 0.5) 
p <- p +     scale_x_log10() 
p <- p +     scale_y_log10() 
p <- p +     xlab(xlabel)
p <- p +     ylab(ylabel)
# show the plot
p

# save it
ggsave(p, file="CC-vs_nCC_kT_prof.pdf", width=8, height=4.5)