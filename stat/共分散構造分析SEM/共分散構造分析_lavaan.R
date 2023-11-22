?PoliticalDemocracy # データセットの説明
# https://lavaan.ugent.be/tutorial/sem.html

model <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ y5 + y6 + y7 + y8
    
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
    
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'

fit <- sem(model, data = PoliticalDemocracy)
summary(fit, standardized = TRUE)
summary(fit, fit.measures = TRUE)

coef(fit) # 係数を表示（変数名と記号から何を表しているか分かる）

# データフレームをCSVファイルとして保存
# write.csv(PoliticalDemocracy, "PoliticalDemocracy.csv")
