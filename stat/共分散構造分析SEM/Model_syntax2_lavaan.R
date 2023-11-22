# https://lavaan.ugent.be/tutorial/syntax2.html

library(lavaan)

# モデルシンタックスの作成（シングルクォーテーションで囲むのを忘れずに）
# デフォルトを上書きしている
HS.model <- ' 
  visual  =~ x1 + x2 + x3 
  textual =~ x4 + x5 + x6
  speed   =~ NA*x7 + x8 + x9 # 制約をしないためのNA
  
  # これらの潜在変数間に相関はない（0を明記する必要がある）
  visual ~ 0*speed
  textual ~ 0*speed
  
  # 分散を1に固定
  speed ~~ 1*speed 

'

fit <- cfa(HS.model, data = HolzingerSwineford1939) # 確認的因子分析の実行

summary(fit, fit.measures = TRUE) # 結果の表示

