# BSGP 7030 assignment 2

Jupyter notebooks and executable scripts to generate a simple linear regression from given `.csv` data. Examples using salary as a function of years of experience are included.

## Description

- Files in `/manual` were generated without the use of an AI agent
- Files in `/ai` were generated with the aid of Cursor Pro

## Project structure

```
assignment2/
├── README.md                              # This file — overview, usage, and setup
├── .gitignore                             # Ignores checkpoints, local Jupyter config, REFLECTION.md
├── environment.yml                        # Conda env (`assignment2`) for Python, R, and Jupyter
│
├── manual/                                # Hand-written code (no AI agent)
│   ├── regression_data.csv                # Sample data (YearsExperience, Salary columns)
│   ├── linear_regression_python.ipynb     # Interactive Python notebook (Canvas-based workflow)
│   ├── linear_regression_python.html      # Static HTML export of the Python notebook
│   ├── linear_regression_python.py        # CLI script — filename, x-column, y-column args
│   ├── linear_regression_python_output.png
│   ├── linear_regression_r.ipynb          # Interactive R notebook (Canvas-based workflow)
│   ├── linear_regression_r.html           # Static HTML export of the R notebook
│   ├── linear_regression_r.r                # CLI script — filename, x-column, y-column args
│   ├── linear_regression_r_output.png
│   └── linear_regression_2/               # Interactive scripts (prompt for inputs)
│       ├── linear_regression_python_2.py
│       ├── linear_regression_python_output_2.png
│       ├── linear_regression_r_2.r
│       └── linear_regression_r_output_2.png
│
└── ai/                                    # AI-generated code (Cursor Pro)
    ├── regression_data.csv                # Same sample input data as manual/
    ├── linear_regression_python.ipynb     # Python notebook with input validation and model metrics
    ├── linear_regression_python.html      # Executed/exported Python notebook
    ├── linear_regression_python.py        # CLI Python script with file and column validation
    ├── linear_regression_output_python.png
    ├── linear_regression_r.ipynb          # R notebook with input validation and model metrics
    ├── linear_regression_r.html           # Executed/exported R notebook
    ├── linear_regression_r.r              # CLI R script with file and column validation
    ├── linear_regression_output_r.png
    ├── export_notebooks.sh                # Executes both notebooks and re-exports .ipynb and .html
    ├── requirements.txt                   # Pip-only fallback if conda is unavailable
    └── PROMPTS.md                         # Cursor prompts used to generate the AI files
```

Scripts and notebooks in both folders read a `.csv`, fit a linear regression, print model fit statistics, and save a scatter plot with the regression line overlaid.

- Files named `linear_regression_<lang>.<ext>` in `manual/` follow the Canvas workflow
- Files in `manual/linear_regression_2/` prompt interactively for filename and column names

## Usage

Jupyter notebooks are included to allow for interactive editing and block execution.

### CLI scripts (`manual/` and `ai/`)

```bash
python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>
Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>
```

- `FILENAME` is the path to a `.csv` file containing numerical data
- `X_COL` is the exact name of the column containing x-values
- `Y_COL` is the exact name of the column containing y-values

> [!NOTE]
> Ensure `.csv` column names do not include spaces

### Interactive scripts (`manual/linear_regression_2/`)

```bash
cd manual/linear_regression_2
python linear_regression_python_2.py
Rscript linear_regression_r_2.r
```

Each script prompts for the filename and column names at runtime.

### Details

- `environment.yml` is included to allow for environment replication
- CLI scripts print model fit statistics to the terminal and export a regression plot as a `.png` file

## Installation

### Clone repo

```bash
git clone https://github.com/cralbers/bsgp7030_assignment2.git
cd bsgp7030_assignment2
```

### Conda environment

A conda environment is recommended because it includes Python, R, Jupyter, and nbconvert together. From `assignment2`:

```bash
conda env create -f environment.yml
conda activate assignment2
```

If conda is unavailable, install the Python dependencies with pip:

```bash
pip install -r ai/requirements.txt
```

You will still need R and `ggplot2` installed separately to run the R notebook and script.

To execute both AI notebooks and regenerate the `.ipynb` and `.html` exports:

```bash
cd ai
./export_notebooks.sh
```

This script creates the `assignment2` conda environment automatically if it does not already exist.

### Run notebooks

Launch JupyterLab:

```bash
jupyter lab
```

Navigate to either `manual/` or `ai/` and open any `.ipynb` file.

## AI documentation

See [`ai/PROMPTS.md`](ai/PROMPTS.md) for the Cursor prompts used to generate the AI files.
