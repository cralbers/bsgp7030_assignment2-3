#!/usr/bin/env bash
# Export linear regression notebooks to executed .ipynb and .html files.
#
# Setup (one-time):
#   conda env create -f environment.yml
#   ./export_notebooks.sh
#
# Note: base Anaconda nbconvert may fail if jupyter_contrib_nbextensions is
# installed there. This script always uses the assignment2-ai conda env instead.
set -eo pipefail
cd "$(dirname "$0")"

ENV_NAME="assignment2-ai"

if ! conda env list | awk '{print $1}' | grep -qx "$ENV_NAME"; then
  conda env create -f environment.yml
fi

eval "$(conda shell.bash hook)"
conda activate "$ENV_NAME"

JUPYTER="$CONDA_PREFIX/bin/jupyter"
PYTHON="$CONDA_PREFIX/bin/python"

if [[ ! -x "$JUPYTER" ]]; then
  echo "Error: expected jupyter at $JUPYTER" >&2
  exit 1
fi

# Prefer conda env binaries over any system/base Anaconda installs on PATH.
export PATH="$CONDA_PREFIX/bin:$PATH"

# Use a local Jupyter config dir to avoid broken user-level nbconvert settings.
export JUPYTER_CONFIG_DIR="$(pwd)/.jupyter_config"
mkdir -p "$JUPYTER_CONFIG_DIR"

if ! "$JUPYTER" kernelspec list 2>/dev/null | grep -q '^ir '; then
  "$CONDA_PREFIX/bin/R" -e 'IRkernel::installspec(name = "ir", displayname = "R")'
fi

run_nbconvert() {
  "$PYTHON" -m nbconvert "$@"
}

run_nbconvert --to notebook --execute linear_regression_python.ipynb \
  --output linear_regression_python.ipynb
run_nbconvert --to html linear_regression_python.ipynb

run_nbconvert --to notebook --execute linear_regression_r.ipynb \
  --output linear_regression_r.ipynb
run_nbconvert --to html linear_regression_r.ipynb
