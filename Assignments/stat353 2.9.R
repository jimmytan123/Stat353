data<-read.table('data 2.9.txt', header=T)
xyfit <- lm(data$Y~ data$X)
summary(xyfit)
anova(xyfit)
## the p-value for the independent variable GMAT is 0.594, which is high value. It is 
## quite larger than the significance level of 0.05. It has strong evidence to against the hypothesis. Therefore, GMAT is not an important
## predictor variable at significance level of 0.05.
