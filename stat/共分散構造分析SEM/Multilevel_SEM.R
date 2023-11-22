# Multilevel SEM
# https://lavaan.ugent.be/tutorial/multilevel.html

library(lavaan)
library(tidyverse)

?Demo.twolevel
head(Demo.twolevel)

table(Demo.twolevel$cluster) # クラスターの数字は1から200の値を取り、それぞれの個数が5,10,15,20
Demo.twolevel %>% filter(cluster==10) # 同一クラスターのなかで、w1とw2の値は固定


model <- '
    level: 1
        fw =~ y1 + y2 + y3
        fw ~ x1 + x2 + x3
    level: 2
        fb =~ y1 + y2 + y3
        fb ~ w1 + w2
'

fit <- sem(model = model, data = Demo.twolevel, cluster = "cluster")
summary(fit)