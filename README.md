# BSGP 7030 assignment 2

Jupyter notebooks and executable scripts to generate a simple linear regression from iven .csv data. Examples using salary as a function of years of experience data are included.

## Description

- Files in /manual were generated without the use of an AI agent
- Files in /ai were generated with the aid of Cursor Pro
- REFLECTION.md

## Usage

Jupyter notebooks are included to allow for interactive editing and block execution. Executable scripts (.py and .R) can be run in the command line using the following syntax:

``` bash
python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>
Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>
```

- FILENAME is the path to a .csv file containing numerical data
- X_COL is the exact name of the column in the .csv containing x-values
- Y_COL is the exact name of the column in the .csv containing y-values

> [!NOTE] 
> Ensure .csv column names do not include spaces

### Details

- executable scripts print the model fit to the terminal and export a graph of the regression model and data.
- files named `linear_regression_<lang>.<ext>` were written using the Canvas code and files named `linear_regression_<lang>_2.<ext>` were written without the code on Canvas.