# R Lecture to VTT - Lecture 3
# Author                : Oguzhan Gencoglu
# Latest Version        : 04.05.2016
# Contact               : oguzhan.gencoglu@tut.fi

# -------------- Neural networks --------------

# generate some data with 2 classes
p <- 2
N <- 200
x <- matrix(rnorm(N*p),ncol=p)
y <- as.numeric((x[,1]^2+x[,2]^2) > 1.4)
plot(x,col=c('black','green')[y+1],pch=19,asp=1)

mydata <- data.frame(x=x, y=y)

# define your neural network topology and train it
library(nnet)
nn1 <- nnet(y~x.1+x.2,data=mydata,entropy=T,size=3,decay=0,maxit=2000,trace=T)

# predict training data (NOTE: normally you predict unseen (test) data)
yhat <- as.numeric(predict(nn1,type='class'))
par(mfrow=c(1,2))
plot(x,pch=19,col=c('black','green')[y+1],main='actual labels',asp=1)
plot(x,col=c('black','green')[(yhat>0.5)+1],pch=19,main='predicted labels',asp=1)
table(actual=y,predicted=predict(nn1,type='class'))

# change number of hidden units
par(mfrow=c(2,2))
for (i in 1:4){
        nn1 <- nnet(y~x.1+x.2,data=mydata,entropy=T,size=i,decay=0,maxit=2000,trace=T)
        yhat <- as.numeric(predict(nn1,type='class'))
        plot(x,pch=20,col=c('black','green')[yhat+1])
        title(main=paste('nnet with',i,'hidden units'))
}

# plot decision boundaries
nn1 <- nnet(y~x.1+x.2,data=mydata,entropy=T,size=3,decay=0,maxit=2000,trace=T)
x1grid <- seq(-3,3,l=200)
x2grid <- seq(-3,3,l=220)
xg <- expand.grid(x1grid,x2grid)
xg <- as.matrix(cbind(1,xg))
h1 <- xg%*%matrix(coef(nn1)[1:3],ncol=1)
h2 <- xg%*%matrix(coef(nn1)[4:6],ncol=1)
h3 <- xg%*%matrix(coef(nn1)[7:9],ncol=1)

par(mfrow=c(2,2))
contour(x1grid,x2grid,matrix(h1,200,220),levels=0)
contour(x1grid,x2grid,matrix(h2,200,220),levels=0,add=T)
contour(x1grid,x2grid,matrix(h3,200,220),levels=0,add=T)
title(main='boundaries from linear functions\n in hidden units')

sigmoid <- function(x){exp(x)/(1+exp(x))}
z <- coef(nn1)[10]+coef(nn1)[11]*sigmoid(h1)+coef(nn1)[12]*sigmoid(h2)+
        coef(nn1)[13]*sigmoid(h3)
contour(x1grid,x2grid,matrix(z,200,220))
title('sum of sigmoids \n of linear functions')
contour(x1grid,x2grid,matrix(sigmoid(z),200,220),levels=0.5)
title('sigmoid of sum of sigmoids \n of linear functions')
contour(x1grid,x2grid,matrix(sigmoid(z),200,220),levels=0.5)
points(x,pch=20,col=c('black','green')[y+1])
title('data values')
