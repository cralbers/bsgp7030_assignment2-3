# AI Generation Prompts (Assignment 3)

This folder was updated with Cursor Pro. The prompts below are the user requests used to enhance the notebooks and scripts, and to add `CODE_REVIEW.md` and `README_ai.md`.

Earlier assignment 2 prompts are recorded in [`PROMPTS_assignment2.md`](PROMPTS_assignment2.md).

---

## Prompt 1: Enhance notebooks

> do not read or look at any files other than the files in assignment3/bsgp7030_assignment2-3/ai directory. first Plan to update the python and R notebooks with enhanded markdown and in line annotations to detail what the code is doing. Print to console, Slope and intercept of the fitted line, correlation coefficient (Pearson’s r) and Mean Squared Error (MSE) between observed and predicted values. Add an annotation of the Equation (y = mx + b using actual slope/intercept) and Correlation coefficient (r) to the graph of the regression

Then:

> Additionally add in a markdown cell to each notebook that explains the interpretation of the slope, intercept, correlation and error that are calculated

Then:

> Implement the plan as specified, it is attached for your reference. Do NOT edit the plan file itself.

**Generated or updated files:**

- `linear_regression_python.ipynb` — section markdown, inline comments, slope/intercept/r/MSE printed, annotated regression plot, interpretation cell
- `linear_regression_r.ipynb` — same workflow in R

---

## Prompt 2: Sync scripts and exported graphs

> Now plan to update the executable scripts and the exported graphs based on the new notebooks

Then:

> Make sure that the slope, intercept, Pearson’s r, MSE, are printed to the console when the scripts are run

Then:

> Implement the plan as specified, it is attached for your reference. Do NOT edit the plan file itself.

**Generated or updated files:**

- `linear_regression_python.py` — prints slope, intercept, Pearson’s r, and MSE; annotates plot
- `linear_regression_r.r` — same console metrics and plot annotation
- `linear_regression_output_python.png` — regenerated annotated plot
- `linear_regression_output_r.png` — regenerated annotated plot

---

## Prompt 3: Code review file

> @Branch review the PR diff in this branch as compared to main

Then:

> Put these comments on the diff into a file called ai/CODE_REVIEW.md

**Generated files:**

- `CODE_REVIEW.md` — review notes for `assignment3` vs `main` (README, HTML exports, notebook outputs, prompts rename, PR description)

---

## Prompt 4: AI folder README

> generate a readme file in the ai folder called README_ai.md for only the files in the ai folder

Then:

> Implement the plan as specified, it is attached for your reference. Do NOT edit the plan file itself.

**Generated files:**

- `README_ai.md` — overview, file inventory, requirements, notebook/CLI usage, and outputs for the `ai/` folder only
