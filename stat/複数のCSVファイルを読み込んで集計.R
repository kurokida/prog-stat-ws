# install.packages("tidyverse") # tidyverseをインストールするときだけ必要
library(tidyverse) # データの集計作業などに便利なライブラリです

skip_row_num = 12 # 重要！　必ず、自分のデータに適した数字にしてください。
# CSVファイルの中でデータの見出しの行から1を引いた値を指定します。
# つまり、CSVファイルの先頭行から、skip_row_num行までのデータは読み込まれません。

# 最初に、Session -> Set working directory -> To source file location を実行してください。
current_directory <- getwd() # 現在のディレクトリ（フォルダ）
# 参加者ひとりにつき、ひとつのCSVファイルがあって、すべてのCSVファイルが
# csv_filesという名前のフォルダに保存されていることを想定しています。
data_directory <- paste(current_directory, "csv_files", sep = "/")

# フォルダ内のCSVファイルのリストを取得
# pattern = "\\.csv$"については深く理解する必要はなく、csvファイルを指定しているという理解で大丈夫です。
# 興味があれば、エスケープ文字、正規表現、などで検索してもらうとよいと思います。
file_list <-
  list.files(path = data_directory,
             pattern = "\\.csv$",
             full.names = TRUE)

all_data <- NULL # 全員分のデータをひとつのデータフレーム（tibble）に集約します
id <- 1 # 参加者にidを割り当てることにします。CSVファイルに参加者識別情報がある場合は不要
for (file_name in file_list) {
  # csvファイルの数だけ読み込みを繰り返します
  print(file_name)
  tmp_data <-
    read.csv(file_name, skip = skip_row_num, header = TRUE)
  tmp_data <- tmp_data %>% mutate(participant_ID = id) # id情報（列）を追加
  id <- id + 1 # idの加算
  all_data <- bind_rows(all_data, tmp_data) # すでに読み込んだデータに加える
}

############################################
# STEP1
# １行がひとりの参加者に対応するようなデータが欲しい場合
# さらに、image_type条件とecc条件ごとの反応時間の平均値を取得することを考えます。
rt_data <- all_data %>%
  filter(image_type != 0) %>% # 練習のデータを取り除く
  group_by(participant_ID, image_type, ecc) %>% # かっこの中はグループ化したい順番
  summarise(mean_RT = mean(RT)) %>% # グループごとの平均値を計算
  pivot_wider(names_from = c(image_type, ecc),
              values_from = mean_RT)

# ひとり分のデータについて、エクエルなどを使って、意図した通りに集計できているかを確認することをお勧めします。

write.csv(rt_data, "rt_data.csv", row.names = FALSE) # 集計結果をcsvファイルとして出力することができます。

############################################
# STEP2
# 条件については上と同じ。各条件ごとの正当数を算出
nCorrect_data <- all_data %>%
  filter(image_type != 0) %>% # 練習のデータを取り除く
  group_nest(participant_ID, image_type, ecc) %>% # 入れ子構造
  mutate(nCorrect = map_int(data, ~ sum(.$correct == 1))) %>%  # 正当数
  select(participant_ID, image_type, ecc, nCorrect) %>%
  pivot_wider(names_from = c(image_type, ecc),
              values_from = nCorrect)

############################################
# STEP3
# 条件については上と同じ。各条件ごとの正当率を算出
correct_rate_data <- all_data %>%
  filter(image_type != 0) %>% # 練習のデータを取り除く
  group_nest(participant_ID, image_type, ecc) %>% # 入れ子構造
  mutate(correct_rate = map_dbl(data, ~ {
    sum(.$correct == 1) / nrow(.)
  })) %>% # 正当率
  select(participant_ID, image_type, ecc, correct_rate) %>%
  pivot_wider(names_from = c(image_type, ecc),
              values_from = correct_rate)
