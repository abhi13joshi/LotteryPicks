library(tidyverse)

getwd()
setwd('C:/Users/abhi1/OneDrive/Documents/NCSUSAC')
numOfLottoPicks <- read_csv("Most_Lottery_Picks.csv")
read.csv("Most_Lottery_Picks.csv")
print(numOfLottoPicks)
view(numOfLottoPicks)



#library(devtools)
#devtools::install_github("abresler/nbastatR")
#library(nbastatR)

#install.packages("readxl")
library(readxl)

library(ggplot2)
library(dplyr)

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

#ggsave(filename = 'Most NBA Lottery Picks by College.png', plot = fullplot)


#install.packages("sqldf")
library(sqldf)


#install.packages("ggimage")
#install.packages("devtools")
#devtools::install_github("lbenz730/ncaahoopR")
#library(ggimage)
#library(ncaahoopR)
#install.packages("ggtextures")
#install.packages("magick")
#library(ggtextures)
#library(magick)

lotterypicks <- read_excel("NBA Lottery Picks 1985-2021.xlsx")
lotterypicks
View(lotterypicks)


lotto_size_by_year <- sqldf("SELECT Year, COUNT(*) AS LotterySize FROM lotterypicks 
      GROUP BY Year ORDER BY Year;")
View(lotto_size_by_year)








#teams <- topten$'School/Previous Team'
#picks <- topten$'Picks'

#H <- picks
#M <- teams

#png(file = "barchart_months_revenue.png")

# Plot the bar chart 
#barplot(H,names.arg=M,xlab="School",ylab="Number of Picks",col="blue",main="Most Lottery Picks since 1985",border="red")

# Save the file
#dev.off()