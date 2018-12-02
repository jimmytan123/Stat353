mydata<-read.table('ventilation.txt', header=T)

plot(mydata$X, mydata$Y, xlab = 'Oxygen Uptake', ylab = 'Expired Ventilation', main = 'Oxygen Uptake vs Expired Ventilation')
fit<- lm(Y ~ X, data = mydata)

library(MASS)
boxcox(fit, lambda=seq(-1,1,0.5), plotit=T)
#The maximum appears when lambda equals to zero, so it suggest using log-transformtion for y


logfit <- lm(log(Y) ~ X, data = mydata)
plot(mydata$X, log(mydata$Y), xlab = 'Oxygen Uptake', ylab = 'log(Expired Ventilation' )
abline(logfit)
summary(logfit)

