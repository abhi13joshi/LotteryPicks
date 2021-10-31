import csv
from collections import Counter
from matplotlib import pyplot as plt
import matplotlib.patches as patches
import pandas as pd
import random
import numpy as np
import seaborn as sns
sns.set()

with open('NBA Lottery Picks 1985-2021.csv', 'r') as lotterypicks:
    csv_reader = csv.reader(lotterypicks)
    print('Here are the lottery picks since the NBA Draft Lottery was implemented in 1985:')
    for line in csv_reader:
        print(line)

    df_raw = pd.read_csv('NBA Lottery Picks 1985-2021.csv')


   # df = pd.read_csv("NBA Lottery Picks 1985-2021.csv")

data = 'NBA Lottery Picks 1985-2021.csv'
df = pd.read_csv(data, index_col=0)
print('Number of lottery picks from each school/previous team')

#mostpicks = df['School/Previous Team'].value_counts()
#columns = ['School/Previous Team', 'Picks']
#mostpicks.to_csv('Most_Lottery_Picks.csv', header = None)
#df_mostpicks = pd.read_csv('Most_Lottery_Picks.csv', names=columns)
#df_mostpicks.to_csv('Most_Lottery_Picks.csv')
#print(df_mostpicks)

df_mostpicks = pd.read_csv('Most_Lottery_Picks.csv').head(10)
print(df_mostpicks)

plt.figure(figsize=(9, 6))

plt.bar(x=df_mostpicks['School/Previous Team'],
        height=df_mostpicks['Picks'],
        color='midnightblue')

plt.xticks(rotation=45)
plt.show()

#df_raw = pd.read_csv('Most_Lottery_Picks.csv')
#df_new = df_raw[['School/Previous Team', 'Picks']].groupby('Picks').apply(lambda x: x.mean()).head(15)
#df_new.sort_values('School/Previous Team', inplace=True)
#df_new.reset_index(inplace=True)

# Draw plot

#fig, ax = plt.subplots(figsize=(16,10), facecolor='white', dpi= 80)
#ax.vlines(x=df.index, ymin=0, ymax=df.Picks, color='firebrick', alpha=0.7, linewidth=20)

# Annotate Text
#for i, cty in enumerate(df.Picks):
 #   ax.text(i, Picks+0.5, round(cty, 1), horizontalalignment='center')


# Title, Label, Ticks and Ylim
#ax.set_title('Bar Chart for Most Lottery Picks', fontdict={'size':22})
#ax.set(ylabel='Picks', ylim=(0, 30))
#plt.xticks(df.index, df.manufacturer.str.upper(), rotation=60, horizontalalignment='right', fontsize=12)

# Add patches to color the X axis labels
#p1 = patches.Rectangle((.57, -0.005), width=.33, height=.13, alpha=.1, facecolor='green', transform=fig.transFigure)
#p2 = patches.Rectangle((.124, -0.005), width=.446, height=.13, alpha=.1, facecolor='red', transform=fig.transFigure)
#fig.add_artist(p1)
#fig.add_artist(p2)
#plt.show()
