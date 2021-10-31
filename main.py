import csv
from collections import Counter
import pandas as pd
from matplotlib import pyplot as plt

with open('NBA Lottery Picks 1985-2021.csv', 'r') as lotterypicks:
    csv_reader = csv.reader(lotterypicks)
    print('Here are the lottery picks since the NBA Draft Lottery was implemented in 1985:')
    for line in csv_reader:
        print(line)

data = 'NBA Lottery Picks 1985-2021.csv'
df = pd.read_csv(data, index_col=0)
print('Number of lottery picks from each school/previous team')
mostpicks = df['School/Previous Team'].value_counts()
columns = ['School/Previous Team', 'Picks']
mostpicks.to_csv('Most_Lottery_Picks.csv', header = None)
df_mostpicks = pd.read_csv('Most_Lottery_Picks.csv', names=columns)
df_mostpicks.to_csv('Most_Lottery_Picks.csv')

print(df_mostpicks)

df_mostpicks = pd.read_csv('Most_Lottery_Picks.csv').head(10)
print(df_mostpicks)

df_mostpicks = pd.read_csv('Most_Lottery_Picks.csv').head(10)
print(df_mostpicks)

plt.figure(figsize=(9, 6))

plt.bar(x=df_mostpicks['School/Previous Team'],
        height=df_mostpicks['Picks'],
        color='midnightblue')

plt.xticks(rotation=45)
plt.show()
