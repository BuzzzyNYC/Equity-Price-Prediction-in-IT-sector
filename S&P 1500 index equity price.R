fsdf<-fs1500y2015
dim(fsdf)
names(fsdf)
data.class(fsdf)
fsdf<-as.data.frame(fsdf)
fsdf<-na.omit(fsdf)

fsdf$yr<-zyear(fsdf$date)
#pivot table of mean for eps by year
tapply(fsdf$eps, fsdf$yr, mean, na.rm=T)
tapply(fsdf$eps, fsdf$sector, mean, na.rm=T)
#2-dimensional pivot table show sector on the row and year on the column
round(tapply(fsdf$eps, list( fsdf$sector, fsdf$yr), mean, na.rm=T),2)

smdf<-fsdf[fsdf$yr==2015,]
dim(smdf)
data.frame(mu=tapply(smdf$mv,smdf$sector, sum,na.rm=T))
data.frame(mu=tapply(smdf$mv,smdf$industry, sum,na.rm=T))
           
#pick a company inside a tech company and so time series
unique(fsdf$name[fsdf$sector=="Information Technology"])
smdf<-fsdf[fsdf$name=="Google Inc. Cl A",]
smdf<-na.omit(smdf)
#or
smdf<-fsdf[fsdf$tkr=="NVDA",]
smdf
#########################################
#####Hist######
par(mfcol=c(2,2))
hist(smdf$price, prob = T, xlab="Price", main = "Fig.1 Histogram of Price");
lines(density(smdf$price))
hist(smdf$eps, prob = T, xlab="Earnings per Share", main = "Fig.2 Histogram of Earnings per Share");
lines(density(smdf$eps))
hist(smdf$bvps, prob = T, xlab="Book Value per Share", main = "Fig.3 Histogram of Book Value per Share");
lines(density(smdf$bvps))
hist(smdf$cfps, prob = T, xlab="Cash Flow per Share", main = "Fig.4 Histogram of Cash Flow per Share");
lines(density(smdf$cfps))

#########time series#########
par(mfcol=c(2,2))
ts.plot(smdf$price, ylab="Price", main = "Fig.5 Time Series Plot of Price")
ts.plot(smdf$eps, ylab="eps", main = "Fig.6 Time Series Plot of EPS")
ts.plot(smdf$bvps, ylab="bvps", main = "Fig.7 Time Series Plot of BVPS")
ts.plot(smdf$cfps, ylab="cfps", main = "Fig.8 Time Series Plot of CFPS")
#####Scatter Plot######
names(smdf)
par(mfcol=c(2,3))
scatter.smooth(smdf$eps, smdf$price,type="n", 
               xlab="Earnings per Share", ylab="Price"); 
title("Fig. 9 Plot of Earnings per Share vs Price")
text(smdf$eps, smdf$price, smdf$tkr, cex=.5)

scatter.smooth(smdf$bvps, smdf$price,type="n", 
               xlab="Book Value per Share", ylab="Price"); 
title("Fig. 10 Plot of Book Value per Share vs Price")
text(smdf$bvps, smdf$price, smdf$tkr, cex=.5)

scatter.smooth(smdf$cfps, smdf$price,type="n", 
               xlab="Cash Flow per Share", ylab="Price"); 
title("Fig. 11 Plot of Cash FLow per Share vs Price")
text(smdf$cfps, smdf$price, smdf$tkr, cex=.5)

####des.stat####
library(YRmisc)
ds.summ(smdf[,c("price", "eps", "bvps", "cfps")], 3)

#####cor. matr.####
smdf<-na.omit(smdf)
dim(smdf)
round(cor(smdf[,8:11]),3)

#####linear model######
fit<-lm(price~eps+bvps+cfps, data = smdf, na.action = na.omit)
summary(fit)
reg.dw(fit)

#####graphs validation###
smdfa<-na.omit(smdf)
vdf<-data.frame(smdfa,p=fit$fitted.values,r=fit$residuals)
rsmdf<-data.frame(smdf, pred = fit$fitted.values, resid = fit$residuals)

par(mfcol=c(2,3))
hist(rsmdf$resid)
scatter.smooth(rsmdf$pred, rsmdf$price, type = "n")
text(rsmdf$pred, rsmdf$price, rsmdf$tkr, cex = .5)
pl.2tsgg(rsmdf$price, rsmdf$pred, "price", "pred")
#########################################
par(mfcol=c(2,3))
hist(smdf$price)
ts.plot(smdf$price)
plot(smdf$eps, smdf$price)
names(smdf)
ds.summ(smdf[,c("price","eps","bvps")],3)
round(cor(smdf[,c("price","eps","bvps","cfps")], use="complete.obs"),3)
fit<-lm(price~eps+bvps+cfps, data=smdf, na.action = na.omit)
summary(fit)

#Durbin-Watson Test takes out forecast bias/error
reg.dw(fit)

#validation graphs
rsmdf<-data.frame(smdf, pred = fit$fitted.values, resid = fit$residuals)
hist(rsmdf$resid)

scatter.smooth(rsmdf$pred, rsmdf$price, type = "n")
text(rsmdf$pred, rsmdf$price, rsmdf$tkr, cex = .5)


