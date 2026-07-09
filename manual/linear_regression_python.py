# assignment 2 
# create a linear regression model (python) to model salary based on years of experience
import sys
import pandas as pd
import matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
from scipy.stats import linregress
from sklearn.metrics import mean_squared_error, root_mean_squared_error

if len(sys.argv) != 4:
    print("Usage: python linear_regression_python.py <filename> <x_column> <y_column>")
    sys.exit(1)

# Assign function arguments to variable names 
filename = sys.argv[1]
x_col = sys.argv[2]
y_col = sys.argv[3]

# import csv file into pandas df and assign x and y variables

df = pd.read_csv(filename)
x = df[x_col]
y = df[y_col]

# fit a linear regression model to the data (salary as a fx of years of experience) 
# and calculate the slope, intercept, r value, MSE, and RMSE
slope, intercept, r_value, p_value, std_err = linregress(x, y)
y_pred = slope * x + intercept
mse = mean_squared_error(y, y_pred)
rmse = root_mean_squared_error(y, y_pred)

# print the slope, intercept, r value, MSE, and RMSE to console
print(f'Slope for linear regression: {slope:.3f}')
print(f'Intercept for linear regression: {intercept:.3f}')
# print(f'Standard error for linear regression: {std_err:.3f}')
print(f'R value for linear regression: {r_value:.3f}')
print(f'MSE for linear regression: {mse:.3f}')
print(f'RMSE for linear regression: {rmse:.3f}')



# graph the raw data and the calculated regression line
# and save the plot to a file "linear_regression_python.png"
plt.scatter(df['YearsExperience'], df['Salary'], color='purple') # graph data from original table
plt.plot(df['YearsExperience'], y_pred, 'g-', label = "Fitted Line") # add in calculated linear regression using model previously generated
plt.text(1.5, df['Salary'].max() - 5000,
         f"y = {slope:.2f}x + {intercept:.2f}\n"
         f"r = {r_value:.2f}\nMSE = {mse:.2f}",
         fontsize=12)
plt.title('Salary vs Experience')
plt.xlabel('Years of Experience')
plt.ylabel('Salary')
plt.legend()
plt.savefig('linear_regression_python.png')
plt.show()

