# AI linear regression (`ai/`)

AI-assisted notebooks and CLI scripts that fit a simple linear regression of salary on years of experience (`y = mx + b`). They print slope, intercept, Pearson’s *r*, and mean squared error (MSE), and save a scatter plot with the regression line annotated with the equation and *r*.

## Files

- `linear_regression_python.ipynb` — Python notebook with section markdown, inline comments, and interpretation
- `linear_regression_r.ipynb` — R notebook (same workflow as Python)
- `linear_regression_python.py` — Python CLI script
- `linear_regression_r.r` — R CLI script
- `linear_regression_output_python.png` — annotated plot from the Python script
- `linear_regression_output_r.png` — annotated plot from the R script
- `regression_data.csv` — sample data (`YearsExperience`, `Salary`)
- `requirements.txt` — pip packages for the Python path
- `PROMPTS.md` — Cursor prompts used for the assignment 3 updates
- `PROMPTS_assignment2.md` — Cursor prompts used for the assignment 2 AI work
- `CODE_REVIEW.md` — notes from reviewing this branch against `main`

## Requirements

**Python:** install from `requirements.txt` (includes `pandas`, `numpy`, `matplotlib`, `scikit-learn`, `jupyter`, `nbconvert`).

```bash
pip install -r requirements.txt
```

**R:** base R plus `ggplot2` for the R notebook and script.

## Usage

Run notebooks and scripts from this `ai/` directory so `regression_data.csv` resolves correctly.

### Notebooks

Open `linear_regression_python.ipynb` or `linear_regression_r.ipynb` and run the cells in order.

### CLI scripts

```bash
python linear_regression_python.py regression_data.csv YearsExperience Salary
Rscript linear_regression_r.r regression_data.csv YearsExperience Salary
```

- `FILENAME` — path to a `.csv` with numeric columns
- `X_COL` — exact name of the predictor column
- `Y_COL` — exact name of the response column

Column names must match the CSV exactly and should not contain spaces.

## Outputs

When a script runs, it prints to the console:

- Slope (`m`)
- Intercept (`b`)
- Pearson’s *r*
- Mean Squared Error (MSE)
- Fitted equation (`y = mx + b`)

It also overwrites the corresponding PNG with a scatter plot, regression line, and on-plot annotation of the equation and *r*.

## Related docs

- See [`PROMPTS.md`](PROMPTS.md) for the prompts used to update the notebooks, scripts, code review, and this README.
- See [`PROMPTS_assignment2.md`](PROMPTS_assignment2.md) for the earlier assignment 2 prompts.
- See [`CODE_REVIEW.md`](CODE_REVIEW.md) for branch review notes.
