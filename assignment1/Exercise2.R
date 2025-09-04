# load the data and analyze the data
CO2 <- scan(file.choose())
CO2 <- ts(CO2,start=c(1958,3),end=c(2024,7),frequency=12)

# a) Plot the periodogram of the time series
spec.pgram(CO2, main="Periodogram of CO2 data")

# b) Load the CO2-trend data and calculate the differences
CO2Trend <- scan(file.choose())
CO2Trend <- ts(CO2Trend,start=c(1958,3),end=c(2024,7),frequency=12)
CO2deTrend <- CO2 - CO2Trend

spec.pgram(CO2deTrend, main="Periodogram of CO2 detrended data")
spec.pgram(CO2, main="Periodogram of CO2 data")

