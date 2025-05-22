# 確認的因子分析
# https://lavaan.ugent.be/tutorial/cfa.html

#install.packages("lavaan", dependencies = TRUE) # 初回だけ
library(lavaan)
library(semTools)

?HolzingerSwineford1939 # データセットの説明
# 中学１年生と２年生を対象に心的能力テストを行った結果。２つの中学校で実施
# 観測変数は９つ

# モデルシンタックスの作成（シングルクォーテーションで囲むのを忘れずに）
HS.model <- ' visual  =~ x1 + x2 + x3 
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data = HolzingerSwineford1939) # 確認的因子分析の実行

summary(fit, fit.measures = TRUE) # 結果の表示

standardizedSolution(fit) # 標準化

reliability(fit) # semToolsを使って信頼性を確認
