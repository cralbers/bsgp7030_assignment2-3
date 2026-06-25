#!/usr/bin/env bash
# Export linear regression notebooks to executed .ipynb and .html files.
#
# Setup (one-time):
#   conda env create -f environment.yml
#   ./export_notebooks.sh
set -eo pipefail
cd "$(dirname "$0")"

ENV_NAME="assignment2-ai"

if ! conda env list | awk '{print $1}' | grep -qx "$ENV_NAME"; then
  conda env create -f environment.yml
fi

eval "$(conda shell.bash hook)"
conda activate "$ENV_NAME"
export PATH="$CONDA_PREFIX/bin:$PATH"

# Use a local Jupyter config dir to avoid broken user-level nbconvert settings.
export JUPYTER_CONFIG_DIR="$(pwd)/.jupyter_config"
mkdir -p "$JUPYTER_CONFIG_DIR"

if ! jupyter kernelspec list 2>/dev/null | grep -q '^ir '; then
  R -e 'IRkernel::installspec(name = "ir", displayname = "R")'
fi

jupyter nbconvert --to notebook --execute linear_regression_python.ipynb \
  --output linear_regression_python.ipynb
jupyter nbconvert --to html linear_regression_python.ipynb

jupyter nbconvert --to notebook --execute linear_regression_r.ipynb \
  --output linear_regression_r.ipynb
jupyter nbconvert --to html linear_regression_r.ipynb
