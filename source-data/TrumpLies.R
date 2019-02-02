library(readr)
library(dplyr)
library(magrittr)
library(lubridate)

TrumpLies <- read_csv("Trumpcheck-YorkU-Dec5.csv",
col_types = cols(date = col_date(format = "%m-%d-%Y")))


TrumpLies <- TrumpLies %>% 
    mutate(month=month(date), year=year(date)) %>%
    mutate(`repeat` = as.factor(`repeat`), 
           category1 = as.factor(category1),
           category2 = as.factor(category2),
           category3 = as.factor(category3),
           category4 = as.factor(category4)
    )

glimpse(TrumpLies)

save(TrumpLies, file="TrumpLies.RData")
