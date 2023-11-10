# https://journals.sagepub.com/doi/10.1177/2515245920951503
# のFig.1を作成

library(tidyverse)

nSimulation <- 5000
nA <- 80 # group A のサンプルサイズ
nB <- 80

d1 <- rep(NA, nSimulation) # 効果量（d）を補完する配列
d2 <- rep(NA, nSimulation)

# 平均と標準偏差は適当
mu <- 50
sd <- 10

# 効果量は0を想定
for (i in 1:5000){
  group_A <- rnorm(nA, mu, sd) # 正規分布から標本抽出
  group_B <- rnorm(nB, mu, sd) # group_Aの平均と標準偏差と一致
  
  ssA <- sum((group_A - mean(group_A))^2) # ss means Sum of Squares
  ssB <- sum((group_B - mean(group_B))^2)
  
  tmp_var <- (ssA + ssB)/(nA + nB - 2) # 不偏分散（プールした分散）
  tmp_sd <- sqrt(tmp_var) # 標準偏差
  d1[i] <- (mean(group_B) - mean(group_A))/tmp_sd # 効果量は、平均値の差を標準偏差で割った値
  
}

# 効果量は0.5を想定
assumed_d <- 0.5
for (i in 1:5000){
  group_A <- rnorm(nA, mu, sd) # 平均と標準偏差は適当
  group_B <- rnorm(nB, mu + assumed_d * sd, sd) # dと標準偏差を掛け合わせたものが、平均値になる
  
  ssA <- sum((group_A - mean(group_A))^2) # ss means Sum of Squares
  ssB <- sum((group_B - mean(group_B))^2)
  
  tmp_var <- (ssA + ssB)/(nA + nB - 2) # 不偏分散（プールした分散）
  tmp_sd <- sqrt(tmp_var) # 標準偏差
  d2[i] <- (mean(group_B) - mean(group_A))/tmp_sd # 効果量は、平均値の差を標準偏差で割った値
}

test_data <- tibble(d1, d2)
long_data <- pivot_longer(test_data, cols = everything(), names_to = "group", values_to ="d_value")
g <- ggplot(long_data, aes(x = d_value, fill = group)) + geom_histogram(position = "identity", alpha = 0.8)
plot(g)