# assignment 2 
# create a linear regression model (python) to model salary based on years of experience

import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
import seaborn as sns


# Ask user for inputs and save to variables 
filename = input("Enter filename: ")
x = input("Enter column name for x values: ")
y = input("Enter column name for y values: ")

# import csv file into pandas df
df = pd.read_csv(filename)

# # make a scatter plot of Salary (y) as a fx of YearsExperience (x)
# plt.scatter(df[x], df[y], color='purple')

# fit a linear regression model to the data (salary as a fx of years of experience)
model = LinearRegression().fit(df[[x]], df[[y]])


# graph the raw data and the calculated regression line
plt.scatter(df[x], df[y], color='purple') # graph data from original table
plt.plot(df[x], model.predict(df[[x]]), color='green') # add in calculated linear regression using model previously generated
plt.title(f'{y} vs {x}')
plt.xlabel(x)
plt.ylabel(y)
plt.savefig('linear_regression_python_output.png', dpi=300, bbox_inches='tight')
# plt.show()


# evaluate the model's performance
r = model.score(df[[x]] ,df[[y]]) # calculate the R squared (fit)

print(f'R^2 value for linear regression: {r}')


# # graph the data and linear regression using seaborn regplot (shading shows 95% CI) 
# sns.set_style('white')
# sns.set_palette('Set2')
# ax = sns.regplot(x =x, y =y, data = df)
# ax.set_title('Salary vs. Experience')





