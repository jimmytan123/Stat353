bush = read.table('election2000.txt', header=T, sep ="\t")
y <- X.Bush
X <- bush[,-1]
X <- X[,-2]
select <- leaps(X,y,method = "Cp", nbest = 10, int = TRUE)
plot(select$size+1, select$Cp, xlab="p+1", ylab="Cp", xlim= c(0,13), ylim =c(0,20), pch=19)
abline(0,1)

Cp5 <- select$Cp[select$size == 5]
Cp5

Cp6 <- select$Cp[select$size == 6]
Cp6

select$which[41:60,]
#x2 x4 x5 x6 x7 xc


step(lm(X.Bush~UnEmpR +Pop +X.Male+X.Male.18+X.Pop.65+X.NonMetro+X.PopPov+NuHouse+ X.Inc.50+X.Inc.75+X.Inc.100, data = bush))
 
modelbyStepwise<- lm(X.Bush~X.Male+X.Male.18+X.Pop.65+X.NonMetro+X.Inc.100, data = bush)
plot(modelbyStepwise)



