# R Lecture to VTT - Lecture 2
# Author                : Oguzhan Gencoglu
# Latest Version        : 03.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# ---------------- Introduction to base plotting system ----------------

# Import a dataset
our_data <- islands

# Take a brief look at the data
head(our_data, 10)

# Take the 10 biggest islands by sorting
our_data <- head(sort(our_data, TRUE), 10)

# Get help for "plot()" function and plot a basic scatter plot
?plot
plot(our_data, ylab = "square miles")

# Add title
title("Introduction to base plotting system - Earth's biggest islands")

# Add labels to data points
text(our_data, labels = names(our_data), adj = c(-0.2,-0.2))


# Another example using the base plotting system
some_data <- co2
head(some_data, 20)

# plot histogram
hist(some_data)
