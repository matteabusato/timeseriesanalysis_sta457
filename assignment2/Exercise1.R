library(tseries)

dollar <- scan(file.choose())
dollar <- ts(log(dollar))

# a) Conduct the ADF test for various lags
adf.test(dollar, k=1)
adf.test(dollar, k=2)
adf.test(dollar, k=5)
adf.test(dollar, k=10)

# b) Conduct Ljung-Box and Bartlett tests on fist differences 
#    and absolute first differences
returns <- diff(dollar)
abs_returns <- abs(returns)

# Ljung-Box test
Box.test(returns, lag=10, type="Ljung")
Box.test(abs_returns, lag=10, type="Ljung")

# Bartlett test
source(file.choose())
bartlett(returns, plot=T)$p.value
bartlett(abs_returns, plot=T)$p.value

# c) Fit AR(1) and ARMA(1,1)
r1 <- arima(abs_returns, order=c(1,0,0))
r2 <- arima(abs_returns, order=c(1,0,1))
r1$aic
r2$aic
