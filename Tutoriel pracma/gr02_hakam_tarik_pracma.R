#Gauss-Hermite Quadrature Formula

f <- gaussHermite(17)
# Integrate exp(-x^2) from -Inf to Inf
sum(f$w) #=> 1.77245385090552 == sqrt(pi)
sqrt(pi)
# Integrate x^2 exp(-x^2)
sum(f$w * f$x^2) #=> 0.88622692545276 == sqrt(pi) /2
# Integrate cos(x) * exp(-x^2)
sum(f$w * cos(f$x)) #=> 1.38038844704314 == sqrt(pi)/exp(1)^0.25

#....................................................................
#Approximation de Tchebytchev

# Approximate sin(x) on [-pi, pi] with a polynomial of degree 9 
# This polynomial has to be beaten:
# P(x) = x - 1/6*x^3 + 1/120*x^5 - 1/5040*x^7 + 1/362880*x^9
# Compare these polynomials
p1 <- rev(c(0, 1, 0, -1/6, 0, 1/120, 0, -1/5040, 0, 1/362880))
p2 <- chebCoeff(sin, -pi, pi, 9)
# Estimate the maximal distance
x <- seq(-pi, pi, length.out = 101)
ys <- sin(x)
yp <- polyval(p1, x)
yc <- chebApprox(x, sin, -pi, pi, 9)

#Error Analysis
max(abs(ys-yp)) # 0.006925271
max(abs(ys-yc)) # 1.151207e-05

# Plot the corresponding curves
plot(x, ys, type = "l", col = "gray", lwd = 5)
lines(x, yp, col = "navy")
lines(x, yc, col = "red")
grid()
