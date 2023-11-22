# x2とx3の係数が等しいという制約を持たせる
# https://lavaan.ugent.be/tutorial/syntax2.html
HS.model2 <- ' visual  =~ x1 + v*x2 + v*x3 
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

fit.HS2 <- cfa(HS.model2, data = HolzingerSwineford1939) # 確認的因子分析の実行

summary(fit.HS2, fit.measures = TRUE) # 結果の表示
