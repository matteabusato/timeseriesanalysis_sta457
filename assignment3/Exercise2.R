library(multitaper)
speech <- ts(scan(file.choose()),frequency=10000)

# 1) Spectral Density function using an AR model
r <- spec.ar(speech,order=5,method="burg")
r <- spec.ar(speech,order=10,method="burg")
r <- spec.ar(speech,order=20,method="burg")
r <- spec.ar(speech,order=30,method="burg")
r <- spec.ar(speech,method="burg")

# 2) Spectral Density function using Multitaper
r <- spec.mtm(speech, nw=4, k=7)
r <- spec.mtm(speech, nw=10, k=18)
r <- spec.mtm(speech, nw=13, k=24)
r <- spec.mtm(speech, nw=15, k=27)
r <- spec.mtm(speech, nw=20, k=36)

# 3) Spectral Density function using Parzen's lag window
source(file.choose())
r <- spec.parzen(speech,lag.max=30,plot=T)
r <- spec.parzen(speech,lag.max=40,plot=T)
r <- spec.parzen(speech,lag.max=60,plot=T)
r <- spec.parzen(speech,lag.max=80,plot=T)
r <- spec.parzen(speech,lag.max=100,plot=T)
