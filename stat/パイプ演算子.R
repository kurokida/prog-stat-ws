# irisのデータセットから、setosaのデータのみを抽出し、線形回帰を行う
# パイプ演算子を使わない昔ながらの方法
iris_setosa <- subset(iris, Species == "setosa")
lm_res <- lm(Sepal.Length ~ Sepal.Width, data = iris_setosa)
summary(lm_res)

# R標準のパイプ演算子
iris |>
  subset(Species == "setosa") |>
  lm(Sepal.Length ~ Sepal.Width, data = _) |>
  summary()

# magrittrのパイプ演算子
iris %>% 
  filter(Species == "setosa") %>% 
  lm(Sepal.Length ~ Sepal.Width, data = .) %>% 
  summary()