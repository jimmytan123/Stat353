bodyfat<-read.table('bodyfat.txt', header=T)

plot(bodyfat$Age, bodyfat$X.fat, xlab = 'Age', ylab = 'Bodyfat', main = 'Age vs Bodyfat')

plot(bodyfat$Gend, bodyfat$X.fat, xlab = 'Gender', ylab = 'Bodyfat', main = 'Gender vs Bodyfat')

model <- lm(bodyfat$X.fat~ bodyfat$Age + bodyfat$Gend)
summary(model)
summary(model)$r.squared 


model2 <- lm(bodyfat$X.fat~ bodyfat$Age + bodyfat$Gend + bodyfat$Age * bodyfat$Gend)
summary(model2)
summary(model2)$r.squared 

