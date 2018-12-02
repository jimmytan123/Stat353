data<-read.table('recovery.txt', header=T)

#First, we read the data and look at the output from a linear regression model
fit <- lm(data$Y ~ data$X1 + data$X2)
summary(fit)

#Residual plots for checking E(e) = 0
library(car)

par(mfrow = c(1,1))
plot(data$X1, fit$residuals, xlab = "Log Dose" , ylab = "Recovery Time")
plot(data$X2, fit$residuals, xlab = "Blood Pressure" , ylab = "Recovery Time")
avPlot(fit, variable = "data$X1")
avPlot(fit, variable = "data$X2")

#residual plot for checking constant variance assumption
par(mfrow = c(1,1))
#fanning out is noticeable, increased variability of the residuals with large fitted values.
plot(fit$fitted.values, fit$residuals, xlab = "Fitted Values", ylab = "Residuals")

#For model 2, try to use log transformations
fit2 <- lm( log(data$Y) ~log(data$X1) + log(data$X2))
summary(fit2)

#Residual plots for checking E(e) = 0
plot(log(data$X1), fit$residuals, xlab = "Log Dose" , ylab = "Recovery Time")
plot(log(data$X2), fit$residuals, xlab = "Blood Pressure" , ylab = "Recovery Time")
avPlot(fit2, variable = "log(data$X1)" )
avPlot(fit2, variable = "log(data$X2)" )

#residual plot for checking constant variance assumption
par(mfrow = c(1,1))
plot(fit2$fitted.values, fit2$residuals, xlab = "Fitted Values model 2", ylab = "Residuals")

#Check the normality assumption
qqnorm(fit2$residuals)
#Do a durbin Watson test
durbinWatsonTest(fit2)
acf(fit2$residuals)
