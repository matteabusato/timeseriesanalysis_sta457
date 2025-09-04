M <- 2048
omega <- c(0:(M-1))/M
gamma <- ((omega - 0.5)^2) / 4
as <- Re(fft(gamma, inverse = TRUE))/M
as_centered <- c(as[(M-20+1):M], as[1:21])
s <- -20:20
plot(s, as_centered, ylab="as", type="h", lwd=2)
