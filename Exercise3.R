M <- 1024
lambda <- 100
omega <- c(0:(M-1))/M
trans <- 1/(1+16*lambda*sin(omega*pi)^4)
cu <- Re(fft(trans))/M
u <- c(-40:40)
plot(u, c(cu[41:2], cu[1:41]), ylab="cu", type="h", lwd=5)

du <- - sqrt(1 - cu) + 1
plot(u, c(du[41:2], du[1:41]), ylab="du", type="h", lwd=5)

