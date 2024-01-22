library(tidyverse)
library(lme4)

dat <- read_csv("../../stat_simu/Larks and Owls.csv")

# 因子型の設定
dat$Subject <- as.factor(dat$Subject)
dat$Chronotype <- as.factor(dat$Chronotype)
dat$Gender <- as.factor(dat$Gender)
dat$Session <- as.factor(dat$Session)
dat$TimeOfDay <- as.factor(dat$TimeOfDay)

barplot(table(dat$MWCount), xlab="マインドワンダリングの回数", ylab="頻度", col="skyblue")

# 一般化線形混合モデル（交互作用なし）
fit0 <- glmer(MWCount ~ Chronotype + TimeOfDay + Sleep + (1 | Subject), data = dat, family = poisson)
result0 <- summary(fit0)

# 一般化線形混合モデル（交互作用あり）
fit1 <- glmer(MWCount ~ Chronotype * TimeOfDay + Sleep + (1 | Subject), data = dat, family = poisson)
result1 <- summary(fit1)

anova(fit0, fit1) # 尤度比検定を行うと fit1のほうが適切なモデル

# JASPでの Estimated marginal means（周辺平均）
# 朝型の人が朝に課題を行った時の期待値（睡眠時間については全体の平均値）
y1 <- result1$coefficients[1] + result1$coefficients[2]*0 + result1$coefficients[3]*1 + result1$coefficients[4]*1 + result1$coefficients[5]*mean(dat$Sleep) + result1$coefficients[6]*0 + result1$coefficients[7]*1
exp(y1) # logの逆関数はexp

# 昼型の人が朝に課題を行った時の期待値（睡眠時間については全体の平均値）
y2 <- result1$coefficients[1] + result1$coefficients[2]*1 + result1$coefficients[3]*0 + result1$coefficients[4]*1 + result1$coefficients[5]*mean(dat$Sleep) + result1$coefficients[6]*1 + result1$coefficients[7]*0
exp(y2) # logの逆関数はexp

# 重回帰分析（変量効果やポアソン分布を指定できない）
fit2 <- lm(MWCount ~ Chronotype * TimeOfDay + Sleep, data = dat)
result2 <- summary(fit2)

# 尤度比検定
anova(fit1, fit2) # 両者に大きな違いはなさそう

# 朝型の人が朝に課題を行った時の期待値（重回帰）。exp関数を使う必要はない
result2$coefficients[1] + result2$coefficients[2]*0 + result2$coefficients[3]*1 + result2$coefficients[4]*1 + result2$coefficients[5]*mean(dat$Sleep) + result2$coefficients[6]*0 + result2$coefficients[7]*1
# 昼型の人が朝に課題を行った時の期待値（重回帰）。exp関数を使う必要はない
result2$coefficients[1] + result2$coefficients[2]*1 + result2$coefficients[3]*0 + result2$coefficients[4]*1 + result2$coefficients[5]*mean(dat$Sleep) + result2$coefficients[6]*1 + result2$coefficients[7]*0

# 得られたデータをそのままプロット
dat %>%
  ggplot(aes(x = TimeOfDay, y = MWCount, color = Chronotype, shape = Chronotype)) +
  geom_jitter(width = 0.1, height = 0)

################################
# ベイズ統計モデリング
library(brms)
brms_res <- brm(
  MWCount ~ Chronotype * TimeOfDay + Sleep + (1 | Subject),
  data = dat, family = poisson
)
summary(brms_res) # result1と一致
conditional_effects(brms_res)


################################
# 一般化線形混合モデルのサンプルサイズ設計
# https://besjournals.onlinelibrary.wiley.com/doi/10.1111/2041-210X.12504
# install.packages("simr") # 初回のみ
library(simr)
# 鳥の個体数（z）が、調査した年（x）によって変化する。その変化（切片）は調査場所（g）によって微妙に変わることが
# 考えられるが全体的な傾向としていては一貫しているだろうというモデル。個体数なのでポアソン分布を想定
model1 <- glmer(z ~ x + (1|g), family="poisson", data=simdata)
summary(model1)
fixef(model1)["x"]
fixef(model1)["x"] <- -0.05 # 固定効果を上書き
set.seed(123)
powerSim(model1)

model2 <- extend(model1, along="x", n=20) # データ数を増やすと検定力は上がる
powerSim(model2)

# サンプルサイズと検定力の関係
pc2 <- powerCurve(model2) # かなり時間がかかる
print(pc2)
plot(pc2)
