# 平均が4のポアソン分布
lambda <- 4
x <- seq(0, 10) # 離散であることに注意
y <- dpois(x, lambda) # xに対応する確率密度
plot(x, y)

# 平均が100のポアソン分布
lambda <- 100
x <- seq(0, 150)
y <- dpois(x, lambda)
plot(x, y)

# 平均が100の正規分布（ポアソン分布とほぼ重なることを確認）
mu <- 100
sigma <- sqrt(100)
curve(dnorm(x, mu, sigma), xlim = c(0, 150), add = TRUE)
