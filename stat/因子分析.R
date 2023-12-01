# 探索的因子分析
# https://htsuda.net/stats/factor-analysis.html　の解説がおすすめです。

#install.packages( "psych" )
#install.packages( "GPArotation" )
library(psych)
library(GPArotation)
library(tidyverse)

# http://shojima.starfree.jp/psychometrics/index.htm　の3社会心理学のための統計学
# 2章　対人認知構造を明らかにする　のデータを使って因子分析をしてみましょう

#myData <- read_csv("../../../stat_ws/v03c2cognition.csv") # アンダーバーに注意。tidyverseが必須
myData <- read_csv("../../stat_ws/v03c2cognition.csv") # アンダーバーに注意。tidyverseが必須

data1 <- myData %>% select(!ID)

correlation = cor( data1, use = "complete.obs" ) # 相関行列を計算
#  If use is "complete.obs" then missing values are handled by casewise deletion (and if there are no complete cases, that gives an error).
fa.parallel( correlation, n.obs = dim(na.omit(data1))[1], fa = "fa" ) # スクリープロットを表示
abline( h = 0 ) # y = 0 の横線を追加

# 相関行列を指定せずにスクリープロットを描画することも可能
fa.parallel( data1, fa = "fa", use = "complete.obs" ) 

# 結果のMRはおそらく、MinRes（最小残差）の略
# h2は共通性、u2は独自性
result = fa(data1, nfactors = 2, fm = "minres", rotate = "varimax", use = "complete.obs" )
print( result, digits = 3, sort = T )

# P30の結果と一致（因子軸を回転しない）
result2 = fa(data1, nfactors = 2, fm = "ml", rotate = "none", use = "complete.obs" )
# 結果のMLは、おそらく最尤法（maximum likelihood methods）
print( result2, digits = 3, sort = F)


# P31の結果と一致
result3 = fa(data1, nfactors = 2, fm = "ml", rotate = "varimax", use = "complete.obs" )
# 結果のMLは、おそらく最尤法（maximum likelihood methods）
print( result3, digits = 3, sort = F)

# P32の結果と少し違う（P32の結果とHADの結果は一致している）promaxのpが大文字もある
result4 = fa(data1, nfactors = 2, fm = "ml", rotate = "promax", use = "complete.obs" )
print( result4b, digits = 3, sort = F)

# 信頼性係数（パッケージ名 psychを指定したほうがよい）
psych::alpha(data1)
# HADの結果と比較
factor1_data <- data1 %>% select("項目3", "項目2", "項目6", "項目1", "項目8")
psych::alpha(factor1_data)
factor2_data <- data1 %>% select("項目9", "項目7", "項目4", "項目10", "項目5")
psych::alpha(factor2_data)
