model2 <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ NA*y5 + y6 + y7 + y8 # y5の係数を1に固定しない
    
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
    
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
    
    dem65 ~~ 1*dem65 # dem65の分散を1に固定
'

fit2 <- sem(model2, data = PoliticalDemocracy)
summary(fit2, standardized = TRUE)
summary(fit2, fit.measures = TRUE)
