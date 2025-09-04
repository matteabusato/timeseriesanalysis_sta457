fatal <- scan(file.choose())
fatal <- ts(log(fatal), start=c(1960,1), end=c(1974, 12), freq=12)

# 1) Seasonally adjust the data
r <- stl(fatal, s.window=3, t.window=21, robust=T)
plot(r)
time <- r $ time.series
acf(time[,'remainder'], main="Correlogram of the remainders")

r <- stl(fatal, s.window=7, t.window=21, robust=T)
plot(r)
time <- r $ time.series
acf(time[,'remainder'], main="Correlogram of the remainders")

r <- stl(fatal, s.window="periodic", t.window=21, robust=T)
plot(r)
time <- r $ time.series
acf(time[,'remainder'], main="Correlogram of the remainders")

# 2) Check irregular component of one of the estimated parameters
r <- stl(fatal, s.window=7, t.window=21, robust=T)
plot(r)
time <- r $ time.series
acf(time[,'remainder'], main="Correlogram of the remainders")
