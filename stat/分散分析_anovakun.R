source("../../stat_ws/anovakun_489.txt") # ANOVA君の読み込み
library(tidyverse)

# 練習用のデータとして http://shojima.starfree.jp/psychometrics/index.htm　を使用します

######################################
# 参加者間2要因
data1 <- read_csv("../../stat_ws/v02c5cognition.csv") # アンダーバーに注意。tidyverseが必須
data2 <- data1 %>% 
  arrange(YOKOKU, JISSHI) %>%
  select(!SANKASHA)
anovakun(data2, "ABs", 3, 2, eta = T)
# a1 = 予告なし、a2 = 再生予告、a3 = 再認予告
# b1 = 再生実施、b2 = 再認実施

######################################
# 2要因混合計画
data1 <- read_csv("../../stat_ws/v02c6animal.csv") # アンダーバーに注意。tidyverseが必須

# 参加者間要因（脳細胞操作 NOUSAIBOU）で並び替えます
data2 <- data1 %>% 
  arrange(NOUSAIBOU) %>% 
  select(!KOTAI)
anovakun(data2, "AsB", 4, 4, auto = T, eta = T)
# a1 = 実験群 (glur2q)、a2 = 別操作群 (lacz)、a3 = 未手術群 (no)、a4 = 無手術群 (sham)
# b1 = 初期、b2 = 前期、b3 = 後期、b4 = 終期
anovakun(data2, "AsB", 4, 4, cm = T, eta = T) # 交互作用の単純主効果がHADの結果と異なる？

######################################
# 参加者内2要因
data1 <- read_csv("../../stat_ws/v02c7emotion.csv") # アンダーバーに注意。tidyverseが必須

data2 <- data1 %>% 
  select(!SANKASHA)

# A = 評判の効果、B = 良い人/悪い人
anovakun(data2, "sAB", 3, 2, auto = T, eta = T)

######################################
# 参加者間1要因 x 参加者内2要因
# JASP Data Library -> ANOVA -> Looks or Personality
data1 <- read_csv("../../stat_ws/Looks or Personality.csv") # アンダーバーに注意。tidyverseが必須
data2 <- data1 %>% 
  select(!participant)
anovakun(data2, "AsBC", 2, 3, 3, auto=T, eta=T)
# a1 = Male, a2 = Female
# b1 = カリスマ性高, b2 = カリスマ性中, b3 = カリスマ性低
# c1 = 魅力度高, c2 = 魅力度中, c3 = 魅力度低