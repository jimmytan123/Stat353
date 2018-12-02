marketdata = read.table('market.txt', header=T)

step(lm(Y1~X1+X2+X3+X4, data = marketdata))
#Result: best model for predict y1 is Y1 ~ X1 + X2 + X3 + X4

step(lm(Y2~X1+X2+X3+X4, data = marketdata))
#Result: best model for predict y2 is Y2 ~ X1 + X2


step(lm(Y3~X1+X2+X3+X4, data = marketdata))
#Result: best model is for predict y3 is Y3 ~ X1 + X3

summary(lm(Y1~X1, data = marketdata))
summary(lm(Y1~X2, data = marketdata))
summary(lm(Y1~X3, data = marketdata))
summary(lm(Y1~X4, data = marketdata))
# X4 is the most important input factor for influencing overhead cost


summary(lm(Y2~X1, data = marketdata))
summary(lm(Y2~X2, data = marketdata))
summary(lm(Y2~X3, data = marketdata))
summary(lm(Y2~X4, data = marketdata))
# X2 is the most important input factor for influencing production cost

