library(tseries)
library(fGarch)
prices <- scan(file.choose())

# 1) ARIMA models
# ADF tests
adf.test(prices, k=1)
adf.test(prices, k=2)
adf.test(prices, k=5)
adf.test(prices, k=10)

# ARIMA(0,1,1)
model1arima <- arima(prices,order=c(0,1,1)) 
res1arima <- model1arima$residuals
plot(res1arima)
Box.test(res1arima, lag=10, type="Ljung")
model1arima$aic

# ARIMA(0,1,2)
model2arima <- arima(prices,order=c(0,1,2)) 
res2arima <- model2arima$residuals
plot(res2arima)
Box.test(res2arima, lag=10, type="Ljung")
model2arima$aic

# 2) ARCH models
model1arch <- garchFit(res2arima~garch(1,0),data=res2arima,trace=F)
summary(model1arch)

model2arch <- garchFit(res2arima~garch(2,0),data=res2arima,trace=F)
summary(model2arch)

model3arch <- garchFit(res2arima~garch(3,0),data=res2arima,trace=F)
summary(model3arch)

model4arch <- garchFit(res2arima~garch(4,0),data=res2arima,trace=F)
summary(model4arch)

model5arch <- garchFit(res2arima~garch(5,0),data=res2arima,trace=F)
summary(model5arch)

# 3) GARCH models
model1garch <- garchFit(res2arima~garch(1,1),data=res2arima,trace=F)
summary(model1garch)

model2garch <- garchFit(res2arima~garch(1,2),data=res2arima,trace=F)
summary(model2garch)

model3garch <- garchFit(res2arima~garch(1,3),data=res2arima,trace=F)
summary(model3garch)

