library(Superpower)

design1 <- ANOVA_design(
  design = "2b", n = 80,
  mu = c(1, 0), sd = 2,
  labelnames = c("condition", "cheerful", "sad"), plot = TRUE)

design1_power <- ANOVA_power(design1, nsims = 1000) # シミュレーション回数を指定できる
design1_exact <- ANOVA_exact(design1) # 通常はこちらでよさそう。計算結果も早い

# sadとcheerfulの順序を変えてみる
design2 <- ANOVA_design(
  design = "2b", n = 80,
  mu = c(0, 1), sd = 2,
  labelnames = c("condition", "sad", "cheerful"), plot = TRUE)

design2_power <- ANOVA_power(design2, nsims = 1000) # 効果量の符号が反転する
design2_exact <- ANOVA_exact(design2)

#############################################################
# cheerfulとsadの2グループに対し、さらにneutralを加えたときの検定力の変化を見る

# neutralが、cheerfulとsadの中間（0.5）だとすると、2グループのときより検定力が下がる
design3 <- ANOVA_design(
  design = "3b", n = 80,
  mu = c(1, 0.5, 0), sd = 2,
  labelnames = c("condition", "cheerful", "neutral", "sad"), plot = TRUE)

#design3_power <- ANOVA_power(design3, nsims = 1000)
design3_exact<- ANOVA_exact(design3)
# cheerfulとsadでは約88%程度の検定力があるが、
# cheerfulとneutralでは約35%となる点に注意

# neutralがcheerfulと同じ平均値だとすると検定力が上がる
design4 <- ANOVA_design(
  design = "3b", n = 80,
  mu = c(1, 1, 0), sd = 2,
  labelnames = c("condition", "cheerful", "neutral", "sad"), plot = TRUE)

#design4_power <- ANOVA_power(design4, nsims = 1000)
design4_exact <- ANOVA_power(design4)

# Within-participants designs

design_within <- ANOVA_design(
  design = "3w", n = 80,
  mu = c(1, 0.5, 0), sd = 2,
  r = 0.5,
  labelnames = c("condition", "cheerful", "neutral", "sad"), plot = TRUE)

power_within <- ANOVA_power(design_within, nsims = 1000)
exact_within <- ANOVA_exact(design_within)

design_result_cross <- ANOVA_design(
  design = "2b*2b", n = 80,
  mu = c(1, 0, 0, 1), sd = 2,
  labelnames = c("condition", "cheerful", "sad", 
                 "voice", "human", "robot"), plot=TRUE
)
power_cross <- ANOVA_power(design_result_cross, nsims = 1000)
# 交互作用の関心の場所によって検定力が低かったりする

design_result_cross2 <- ANOVA_design(
  design = "2b*2b", n = 80,
  mu = c(1, 0, 0, 0), sd = 2,
  labelnames = c("condition", "cheerful", "sad", 
                 "voice", "human", "robot"), plot=TRUE
)
power_cross2 <- ANOVA_power(design_result_cross2, nsims = 1000)

design_result <- ANOVA_design(
  design = "3b*2b", n = 50,
  mu = c(1, 2, 2, 3, 3, 4), sd = 3, plot = TRUE
)

plot_power(design_result, min_n = 10, max_n = 100, desired_power = 90, plot = TRUE)

# 条件で参加者数や標準偏差が異なるときのシミュレーション
# null効果を見るには、powerが5%よりも小さいかどうかをチェック
# 以下の例では、参加者数もsdもばらばらでType1エラーが高くなっている
design_violation <- ANOVA_design(
  design = "2b*2b", n = c(20, 80, 40, 80),
  mu = c(0, 0, 0, 0), sd = c(3, 1, 5, 1),
  labelnames = c("condition", "cheerful", "sad", 
                 "voice", "human", "robot"), plot=TRUE
)
res_violation = ANOVA_power(design_violation, nsims = 10000)

# すべての条件のnが80で等しいときには、powerが5%未満なのでOK
design_violation2 <- ANOVA_design(
  design = "2b*2b", n = c(80, 80, 80, 80),
  mu = c(0, 0, 0, 0), sd = c(3, 1, 5, 1),
  labelnames = c("condition", "cheerful", "sad", 
                 "voice", "human", "robot"), plot=TRUE
)
res_violation2 = ANOVA_power(design_violation2, nsims = 10000)
