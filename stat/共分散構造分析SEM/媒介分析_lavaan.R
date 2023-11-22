# 社会心理学のための統計学（清水先生、荘島先生）のP126の内容をRで分析しています
# https://www.seishinshobo.co.jp/book/b286827.html
# 
library(tidyverse) # 初回は、install.packages("tidyverse")が必要
library(lavaan) # 初回は、install.packages("lavaan")が必要。lavaanは共分散構造分析でも使われます。

# http://shojima.starfree.jp/psychometrics/index.htm の8章のCSVファイル
myData <- read_csv("../../../stat_ws/v03c8generaltrust.csv") # アンダーバーに注意。tidyverseが必須

# lavaanの公式サイトによる解説　https://lavaan.ugent.be/tutorial/mediation.html
myModel <- '
  # 直接効果 direct effect
  一般的信頼 ~ c*国
  
  # 媒介変数 mediator
  関係流動性 ~ a*国
  一般的信頼 ~ b*関係流動性
  
  # 間接効果 indirect effect
  ab := a*b
  
  # 総合効果 total effect
  total := c + (a*b)
  
'

fit <- sem(model = myModel, 
           data = myData) 
summary(fit)

# https://kscscr.com/archives/r-and-lavaan-sem-mediation-bootstrap.html
# 警告が出るかもしれない
fit2 <- sem(model = myModel, 
           data = myData,
           se = "bootstrap",
           bootstrap = 1000)
summary(fit2, standardized=T, fit.measure=T, ci = TRUE)
# ブートストラップ信頼区間の値がHADと異なる点が気になる（要確認）
# 標本生成法 = ノンパラメトリック,　信頼区間推定法 = バイアス修正法　が関係しているかもしれない

# Std.lvとStd.allに関する説明
# https://lavaan.ugent.be/tutorial/sem.html

bootstrap_result <- bootstrapLavaan(fit, R = 2000, type = "nonparametric")
tmp <- as.data.frame(bootstrap_result)
indirect_effect <- tmp$a*tmp$b
mean(indirect_effect, na.rm = T)
quantile(indirect_effect, probs = c(0.025, 0.975), na.rm = T)
