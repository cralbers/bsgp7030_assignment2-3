# AI Generation Prompts

This folder was built with Cursor Pro. The prompts below are the user requests used to generate the files here.

## Input data (not generated)

- `regression_data.csv` — provided as input data for the regression examples (`YearsExperience`, `Salary`).

---

## Prompt 1: Notebook project plan

> Working within the ai subfoler and given the ai/@assignment2/ai/regression_data.csv file, plan a project that will generae jupyter notebooks, one in python and one in R, that import and read the csv, create a scatter plot of the data, fit a linear regression model, overlay the regression line onto he scatter plot, evauate the model's performance and save the notebooks as .ipynb and .html files. Do this without referencing the files present in the assignment2/manual folder

**Generated or planned files:**

- `linear_regression_python.ipynb`
- `linear_regression_r.ipynb`
- `linear_regression_python.html`
- `linear_regression_r.html`
- `export_notebooks.sh`
- `requirements.txt`
- `environment.yml`

This prompt essentially duplicated the files present in my manual folder because I had already accidentally read those files into the chat history previously. I didn't realize this until I reviewed the notebooks individually.

---

## Prompt 2: Implement notebook plan

> Implement the plan as specified, it is attached for your reference. Do NOT edit the plan file itself.

**Generated files:**

- `linear_regression_python.ipynb` — load CSV, scatter plot, fit `LinearRegression`, overlay regression line, report R²/RMSE/MAE/residual SE
- `linear_regression_r.ipynb` — same workflow using `read.csv()`, `ggplot2`, and `lm()`
- `export_notebooks.sh` — executes both notebooks and exports `.html` outputs
- `requirements.txt` — Python dependencies (pip fallback)
- `linear_regression_python.html` — executed notebook export
- `linear_regression_r.html` — executed notebook export

---

## Prompt 3: Use conda environment

> Use a conda env instead of a venv

**Updated files:**

- `environment.yml` — defines the `assignment2-ai` conda env (Python, Jupyter, R, ggplot2, IRkernel)
- `export_notebooks.sh` — updated to create/activate the conda env, register the R kernel if needed, and run `nbconvert` with a local `.jupyter_config` directory
- `requirements.txt` — kept as a pip-only fallback; conda setup is preferred via `environment.yml`

---

## Prompt 4: CLI scripts plan

> using the jupyter noteboks in the ai folder, generate executable python and r scripts that take three arguments- filename, x-column and y-column so that the linear regression analysis can be run on any given .csv file. the executable files should export the final regression plot into the ai folder as .png files named "linear_regression_output_{lang}.png"

**Planned files:**

- `linear_regression_python.py`
- `linear_regression_r.r`
- `linear_regression_output_python.png` (generated at runtime)
- `linear_regression_output_r.png` (generated at runtime)

---

## Prompt 5: Implement CLI scripts

> Implement the plan as specified, it is attached for your reference. Do NOT edit the plan file itself.

**Generated files:**

- `linear_regression_python.py` — CLI script: `python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>`
- `linear_regression_r.r` — CLI script: `Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>`

Both scripts print model metrics to the terminal and save regression plots to this folder as:

- `linear_regression_output_python.png`
- `linear_regression_output_r.png`

