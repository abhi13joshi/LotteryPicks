#install.packages("tidyverse")
#install.packages("readxl")
#install.packages("ggplot2")
#install.packages("dplyr")
library(tidyverse)
library(readxl)
library(ggplot2)
library(dplyr)

numOfLottoPicks <- read_csv("Most_Lottery_Picks.csv")
read.csv("Most_Lottery_Picks.csv")
print(numOfLottoPicks)
view(numOfLottoPicks)

teams <- numOfLottoPicks$'School/Previous Team'
picks <- numOfLottoPicks$'Picks'
numOfLottoPicks['School/Previous Team'][numOfLottoPicks['School/Previous Team'] == "California-Los Angeles"] <- "UCLA"
numOfLottoPicks['School/Previous Team'][numOfLottoPicks['School/Previous Team'] == "Nevada-Las Vegas"] <- "UNLV"

view(numOfLottoPicks)

topthirty <- head(numOfLottoPicks,n=30)
view(topthirty)

print(teams)

topfifteen <- head(numOfLottoPicks,n=15)

teams <- topfifteen$'School/Previous Team'
picks <- topfifteen$'Picks'
rename.values(teams, 'California-Los Angeles' = 'UCLA')
rename.values(teams, 'Nevada-Las Vegas' = 'UNLV')

view(topfifteen)

plot<-ggplot(topfifteen, aes(y=reorder(teams, +picks), x=picks))
plot

fullplot <- plot + geom_bar(stat='identity', color = 'black', 
                            fill = c('#003087', '#0033A0', '#7BAFD4', '#0051BA', '#CC0033',
                                     '#000E2F', '#FFCB05', '#2D68C4', '#F76900', '#8D817B',
                                     '#BF5700', '#CF0A2C', '#990000', '#B3A369', '#BB0000'))  + 
  labs(title="Most Lottery Picks since 1985", 
       caption = 'Data Viz by Abhi Joshi | Data from NBA.com',
        y='Colleges', x='Number of Picks') + geom_label(mapping=aes(label=picks))
fullplot

ggsave(filename = 'Most NBA Lottery Picks by College.png', plot = fullplot)
