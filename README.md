
# BSGP 7030 assignment 2/3

Jupyter notebooks and executable scripts to generate a simple linear regression from given `.csv` data. Examples using salary as a function of years of experience are included. This repository contains code that expands upon the original Assignment 2 files by adding markdown annotations and further statistical output.




## Project Structure

- Files in `/manual` were generated without the use of an AI agent
- Files in `/ai` were generated with the aid of Cursor Pro

### Relevant assignment files 
- Manually generated README: `/README.md`
- AI code review output: `/ai/CODE_REVIEW.md`
- AI generated README: `/ai/README_ai.md`
- Prompts log: `ai/PROMPTS.md`
- Original main-branch commit URL before merging assignment3: [link](https://github.com/cralbers/bsgp7030_assignment2-3/commit/2822d8040677b343436c81189f38d1acc877742f)
- Assignment3 branch URL: [link](https://github.com/cralbers/bsgp7030_assignment2-3/tree/assignment3)
- Tagged main-branch URL after the merge 
    - Merge after adding manual files: [link](https://github.com/cralbers/bsgp7030_assignment2-3/releases/tag/assignment3-final)
    - Merge after adding ai files: [link](https://github.com/cralbers/bsgp7030_assignment2-3/releases/tag/assignment3-ai)
## Installation and setup

Clone the project

```bash
  git clone https://github.com/cralbers/bsgp7030_assignment2-3
```

Go to the project directory

```bash
  cd bsgp7030_assignment2
```

Create conda environment

```bash
  conda env create -f environment.yml
```








## Usage/Examples

Executable scripts in `/manual` and `/ai` return linear regression analysis statistics and a png of regression graph.

```bash
python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>
Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>
```
- `FILENAME` is the path to a `.csv` file containing numerical data
- `X_COL` is the exact name of the column containing x-values
- `Y_COL` is the exact name of the column containing y-values

### Notes

- Executable scripts print regression statistics to the terminal and export a regression plot as a `.png` file
- Ensure `.csv` column names do not include spaces

## NOTES
This README file was generated manually using the template builder [readme.so](https://readme.so/)

