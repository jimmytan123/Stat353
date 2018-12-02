data<-read.table('vocabulary.txt', header=T)

#scatter plot
plot(data$X, data$Y, xlab = "Age" , ylab = "Vocabulary")

#look at the output of regression model 
fit <- lm( Y~ X, data = data)
summary(fit)

#Obtain cook's distance measures
library(car)
cd <- cooks.distance(fit)
#plot cook distance versus index
index<- seq(1,10)
plot(index, cd, xlab = "Index", ylab = "Cook's Distance")


influence.measures(fit)

#finding some points that have high leverage 
plot(index, hatvalues(fit), xlab = "Index", ylab = "Hat Values")
abline(h = 2*2/10)

