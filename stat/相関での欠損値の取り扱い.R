# cor関数の use = "complete.obs"　の役割について
# これが指定されているとき欠損値は無視されます
data <- data.frame(
  A = c(1, 2, 3, 4, 5),
  B = c(2, 3, NA, 5, 6),
  C = c(3, 4, 5, 6, 7)
)

# 相関行列の計算（欠損値を無視）
cor_matrix <- cor(data, use = "complete.obs")
print(cor_matrix)

# 相関行列の計算（欠損値を無視しない）
cor_matrix_without_complete_obs <- cor(data)
print(cor_matrix_without_complete_obs)

na.omit(data)
