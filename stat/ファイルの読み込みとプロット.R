library(tidyverse)
data1 <- read.csv("Sleep.csv")
data2 <- read_csv("Sleep.csv") # アンダーバーであることに注意。tidyverseが必須

data <- read_csv("Sleep.csv")
data$group <- as.factor(data$group) # groupの型をdoubleからfactorに

# JASPの記述統計と比較してみよう
data %>% 
  group_by(group) %>% 
  summarise(
    a = mean(extra),
    b = sd(extra),
    c = min(extra),
    d = max(extra)
  )

# バイオリンプロット+箱ひげ図
ggplot(data, aes(x = group, y = extra)) +
  geom_violin(trim = FALSE) +
  geom_boxplot() +
  geom_dotplot(binaxis = "y", stackdir = "center")
