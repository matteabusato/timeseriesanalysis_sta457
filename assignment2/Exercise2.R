tides <- scan(file.choose())
tides <- ts(tides, frequency=24)

# a) Fit an AR model using AIC
r1 <- ar.yw(tides, aic=T, order.max=20)
spec.ar(r1)

# b) Test if white noise model assumption for residuals is correct
resid <- r1$resid[(21):length(tides)]

# Correlogram
acf(resid, main="Correlogram of the Residuals")

# Box-Ljung-Pierce tests
Box.test(resid, lag=10, type="Box-Pierce")
Box.test(resid, lag=10, type="Ljung-Box")

# Bartlett test
source(file.choose())
bartlett(resid, plot=T)$p.value

# Runs tests
library(tseries)
y <- factor(ifelse(resid>0,-1,1))
runs.test(y)

# Comparing variances
var(resid)
var(tides)
