library(readr)
library(dplyr)
library(magrittr)
library(lubridate)
library(forcats)

# NB: had to manually remove the blank lines ",,,,,,,," at the end of the file created by Excel. Ugh

TrumpLies <- read_csv("source-data/Trumpcheck-YorkU-Dec5.csv",
col_types = cols(date = col_date(format = "%m-%d-%Y")))


TrumpLies <- TrumpLies %>%
    mutate(month=month(date), year=year(date)) %>%
    mutate(`repeat` = factor(`repeat`, labels=c("no", "yes")),
           category1 = as.factor(category1),
           category2 = as.factor(category2),
           category3 = as.factor(category3),
           category4 = as.factor(category4)
    )

glimpse(TrumpLies)

save(TrumpLies, file="data/TrumpLies.RData")

# simple histogram
library(ggplot2)
library(scales)
# to plot the density also, use trick from https://stat.ethz.ch/pipermail/r-help/2011-June/280588.html
ggplot(TrumpLies, aes(x=date))  +
  geom_histogram(binwidth=20, colour="black", fill="lightblue") +
  geom_density(aes(y=30* ..count..), alpha=.2, fill="#FF6666") +
  scale_x_date(labels = scales::date_format("%Y-%m"),
               breaks = seq(min(TrumpLies$date)-5, max(TrumpLies$date)+5, 30)) +
  ylab("Number of False Claims") + xlab("Year and Month") +
  theme_bw() + theme(axis.text.x = element_text(angle=45, vjust = 1, hjust=1))


