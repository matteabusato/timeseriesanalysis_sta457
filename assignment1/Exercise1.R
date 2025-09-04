# load the data and analyze the data on the log-scale
dollar <- scan(file.choose())
dollar <- ts(log(dollar))

# define the first differences of the time series
returns <- diff(dollar)

# a) plot the correlogram and periodogram of the original data
acf(dollar, main="Correlogram of log-transformed Dollar Exchange Rate")
spec.pgram(dollar, main="Periodogram of log-transformed Dollar Exchange Rate")

# b) plot the correlogram and periodogram of the first differences
acf(returns, main="Correlogram of First Differences (Returns)")
spec.pgram(returns, main="Periodogram of First Differences (Returns)")

# d) plot the correlogram and periodogram of the absolute values of the 
#    first differences
abs_returns <- abs(returns)
acf(abs_returns, main="Correlogram of Absolute Returns")
spec.pgram(abs_returns, main="Periodogram of Absolute Returns")
