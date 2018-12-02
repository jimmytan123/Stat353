data<-read.table('abrasion.txt', header=T)

#The matrix X'X
A  = matrix(c(30,2108,5414,2108,152422,376562,5414,376562, 1015780), nrow = 3, ncol = 3)


#The inverse of X'X, (X'X)^-1
A.inv <- solve(A)
A.inv

#The matrix X'y
B = matrix(c(5263,346867,921939), nrow = 3, ncol = 1)
B

#Least square of estimates beta hat, (X'X)^-1X'y
A.inv%*%B



# Fit the model
model <- lm(data$Loss~ data$x1 + data$x2)
summary(model)

# obtain the coefficent of variation R^2
summary(model)$r.squared 


