data<-read.table('anscombe.txt', header=T)

plot(data$Set1x,data$Set1y,xlab='Set1 x',ylab='Set1 y',main='Set1x Vs Set1y')
set1xyfit <- lm(data$Set1y~ data$Set1x)
summary(set1xyfit)
abline(set1xyfit)

anova(set1xyfit)
cor(data$Set1x,data$Set1y)
summary(set1xyfit)$r.squared

plot(data$Set2x,data$Set2y,xlab='Set2 x',ylab='Set2 y',main='Set2x Vs Set2y')
set2xyfit <- lm(data$Set2y~ data$Set2x)
summary(set2xyfit)
abline(set2xyfit)

anova(set2xyfit)
cor(data$Set2x,data$Set2y)
summary(set2xyfit)$r.squared


plot(data$Set3x,data$Set3y,xlab='Set3 x',ylab='Set3 y',main='Set3x Vs Set3y')
set3xyfit <- lm(data$Set3y~ data$Set3x)
summary(set3xyfit)
abline(set3xyfit)

anova(set3xyfit)
cor(data$Set3x,data$Set3y)
summary(set3xyfit)$r.squared


plot(data$Set4x,data$Set4y,xlab='Set4 x',ylab='Set4 y',main='Set4x Vs Set4y')
set4xyfit <- lm(data$Set4y~ data$Set4x)
summary(set4xyfit)
abline(set4xyfit)

anova(set4xyfit)
cor(data$Set4x,data$Set4y)
summary(set4xyfit)$r.squared

