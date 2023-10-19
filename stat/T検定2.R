# 1標本のt検定 One sample t-test

# JASPを起動

# Open -> Data Library -> T-Tests -> Weight Gain
# 8週間のカロリー過剰摂取前後の体重の変化
# 分析には Difference（単位はポンド）のみを使用
# 8週間後に、16ポンドを超えているかどうかを検定

library(tidyverse) # 初回は、install.packages("tidyverse")が必要
 
data <- read_csv("../../stat_ws/Weight Gain.csv") # アンダーバーに注意。tidyverseが必須

data$`Weight Before` # カロリー摂取前の体重
data$`Weight After` # カロリー摂取後の体重
data$Difference
mean(data$Difference)
summary(data$Difference)

# Rで1標本のt検定
t.test(data$Difference, mu = 16) # 16ポンドと有意に異なる（16ポンドも体重は増加はしていない）

# JASPの95% CIと一致させるには、基準をそろえる必要がある
res <- t.test(data$Difference, mu = 16)
res$conf.int[1] - 16 # JASPでは0を基準としているが、Rでは16を基準
res$conf.int[2] - 16 # JASPでは0を基準としているが、Rでは16を基準

boxplot(data$Difference)

# JASPで効果量を表示するには、Effect sizeにチェックを入れる

library(effectsize)
cohens_d(data$Difference, mu = 16)

#########################################################
# 独立したサンプルのt検定 Independent samples t-test

# Open -> Data Library -> T-Tests -> Directed Reading Activities

# DRTA（Directed Reading Thinking Activity）とは、生徒が文章について質問し、予測を立て、
# その予測を確認または反証するために読むことを指導すること。
# DRTAを実施するグループ (Treatment, g=0, Group 2) と
# 実施しないグループ (Control, g=1, Group 1) とで、読書力 (drp) に差が生じるかどうかを検証

data_dra <- read_csv("../../stat_ws/Directed Reading Activities.csv") # アンダーバーに注意。tidyverseが必須
data_dra$group <- as.factor(data_dra$group) # groupの型をcharactorからfactorに
data_dra$g <- as.factor(data_dra$g) # gの型をdoubleからfactorに

t.test(drp ~ group, data = data_dra) # 両側検定をしているのでJASPの結果よりもp値が大きい
t.test(drp ~ group, data = data_dra, alternative = "less") # JASPの結果と一致
t.test(drp ~ group, data = data_dra, alternative = "less", var.equal = TRUE) # Student

# 効果量
cohens_d(drp ~ group, data = data_dra, pooled_sd = FALSE) # JASPと一致（等分散を仮定していない）


#########################################################
# 対応のあるサンプルのt検定 Paired samples t-test

# Open -> Data Library -> T-Tests -> Moon and Aggression

# 満月とそうでないときの、認知症患者の破壊的行動の回数

data_moon <- read_csv("../../stat_ws/Moon and Aggression.csv") # アンダーバーに注意。tidyverseが必須
t.test(data_moon$Moon, data_moon$Other, paired = TRUE)
cohens_d(data_moon$Moon, data_moon$Other, paired = TRUE)
shapiro.test(data_moon$Moon - data_moon$Other)

#########################################################
# ベイジアン独立サンプルのt検定 Bayesian independent samples t-test 

# Open -> Data Library -> T-Tests -> Stereograms
# ステレオグラムを両眼融合して奥行きを知覚するまでの時間について、
# 知覚される内容に関する情報を与える群 (VV: Group 2) が
# 与えない群(NV: Group 1) よりも速いかどうかを検証
# https://psycnet.apa.org/record/1976-06036-001

