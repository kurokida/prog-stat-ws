library(tidyverse)
library(jsonlite)

data <- read.csv("mydata.csv")

tmp <- data %>% 
  filter(trial_type == "survey-likert") %>% 
  select(response)

df <- fromJSON(tmp$response)
df$Q0
df$Q1



# JSON文字列をそのまま貼り付け
# json_txt <- '[{"key":" ","rt":3179},
#               {"key":" ","rt":3826},
#               {"key":" ","rt":4549},
#               {"key":" ","rt":5286},
#               {"key":" ","rt":6096},
#               {"key":" ","rt":6797},
#               {"key":" ","rt":7519}]'

# JSON を data.frame に変換
df <- fromJSON(json_txt)

df

data2 <- read.csv("table2.csv")
tmp_df <- data2 %>% 
  filter(trial_index == 4) %>% 
  select(response)

df2 <- fromJSON(tmp_df$response)
