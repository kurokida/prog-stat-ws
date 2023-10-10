library(tidyverse)

##### 1標本 ########
data <- read_csv("Weight Gain.csv")
res <- t.test(data$Difference, mu = 16)
# JASPの95% CIと一致させるには、基準をそろえる必要がある
res$conf.int[1] - 16 # JASPでは0を基準としているが、Rでは16を基準
res$conf.int[2] - 16 # JASPでは0を基準としているが、Rでは16を基準

hist(data$Difference)

##### 独立した2グループの比較 #####
data2 <- read_csv("Directed Reading Activities.csv")
t.test(drp ~ group, data = data2) # 両側検定をしているのでJASPの結果よりもp値が大きい
t.test(drp ~ group, data = data2, alternative = "less") # JASPの結果と一致

# controlとtreatで分ける方法
data_control <- data2 %>% filter(group == "Control")
data_treat <- data2 %>% filter(group == "Treat")
t.test(data_control$drp, data_treat$drp, alternative = "less")

##### 効果量を手動で計算してみる ########
# 母分散（等分散を仮定）の不偏推定量
n1 <- length(data_control$id)
n2 <- length(data_treat$id)
s <- ((n1 - 1)*var(data_control$drp) + (n2 - 1)*var(data_treat$drp))/(n1 + n2 - 2)
  
# 効果量（等分散を仮定）
(mean(data_control$drp) - mean(data_treat$drp)) / sqrt(s)

##### effectsizeパッケージを使ってみる ########
library(effectsize)
cohens_d(drp ~ group, data = data2)
cohens_d(drp ~ group, data = data2, pooled_sd = FALSE) # JASPと一致（等分散を仮定していない）
