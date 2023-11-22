# https://lavaan.ugent.be/tutorial/groups.html
library(lavaan)
HS.model3 <- ' 
  visual  =~ x1 + x2 + x3 
  textual =~ x4 + x5 + x6
  speed   =~ x7 + x8 + x9 '

fit.HS3 <- cfa(HS.model3, data = HolzingerSwineford1939, group = "school") # 確認的因子分析の実行

summary(fit.HS3) # 結果の表示
