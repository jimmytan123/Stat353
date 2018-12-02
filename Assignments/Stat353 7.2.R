halddata = read.table('hald.txt', header=T)
halddata[1:13,]
#attach(halddata)
library(leaps)

#r2
X <- halddata[,-1] #take out Y
y <- halddata$Y
select <- leaps(X,y,method = "r2", nbest = 10, int = TRUE)

plot(select$size+1, select$r2, xlab="p+1", ylab="r2", pch=19)
abline(h=0.7)

rSquare3 <- select$r2[select$size == 3]
rSquare3

select$which[0:15,]
#best model is y~x1+x2+x4

#Cp statistics
X <- halddata[,-1] #take out Y
y <- halddata$Y
select <- leaps(X,y,method = "Cp", nbest = 10, int = TRUE)

plot(select$size+1, select$Cp, xlab="p+1", ylab="Cp", pch=19)
abline(0,1)

plot(select$size+1, select$Cp, xlab="p+1", ylab="Cp", xlim=c(0,7),ylim=c(0,15),pch=19)
abline(0,1)

Cp3 <- select$Cp[select$size == 3]
Cp3

Cp4 <- select$Cp[select$size == 4]
Cp4

select$which[0:15,]
#best model is y~x1+x2+x4


#Backwards Selection
#Set alpha = 0.1 to drop a variable

#fit the full model
summary(lm(Y ~ X1 + X2 + X3+ X4, data = halddata))

#Result: X3 dropped

#fit the model without X3
summary(lm(Y ~ X1 + X2 + X4, data = halddata))

#Result: X4 dropped

#fit the model without X4, X3
summary(lm(Y ~ X1 + X2, data = halddata))

#Result: No more variables are dropped as all p-values are less than 0.1
# Y ~ X1 + X2

#Forward Selection
#Choose a preset alpha = 0.05 to keep a variable in the model

# a) Fit the model with only 1 variable and choose the model which has the highest t value

summary(lm(Y~X1 , data = halddata))

summary(lm(Y~X2 , data = halddata))

summary(lm(Y~X3 , data = halddata))

summary(lm(Y~X4 , data = halddata))

#Result: X4 enters the model

# b) Fit the model with 2 variables

summary(lm(Y~X4+X1 , data = halddata))

summary(lm(Y~X4+X2 , data = halddata))

summary(lm(Y~X4+X3 , data = halddata))

#Result: X1 enters the model

# c) Fit the model with 3 variables

summary(lm(Y~X4+X1+X3 , data = halddata))

summary(lm(Y~X4+X1+X2 , data = halddata))

# Result: The p-value of these two models is larger than the preset alpha = 0.1
# Therefore, Y~X1+X2

##StepwiseSelection
step(lm(Y~X1+X2+X3+X4, data = halddata), direction = "both")
## Therefore, model is Y~X1+X2+X4 because it has lower AIC than the full model.

