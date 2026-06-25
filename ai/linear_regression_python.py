#!/usr/bin/env python3
import sys
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
from sklearn.linear_model import LinearRegression


def usage() -> None:
    print(
        "Usage: python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>",
        file=sys.stderr,
    )


def main() -> None:
    if len(sys.argv) != 4:
        usage()
        sys.exit(1)

    filename, x_col, y_col = sys.argv[1], sys.argv[2], sys.argv[3]

    df = pd.read_csv(filename)
    missing = [col for col in (x_col, y_col) if col not in df.columns]
    if missing:
        print(f"Error: column(s) not found: {', '.join(missing)}", file=sys.stderr)
        sys.exit(1)

    x = df[[x_col]]
    y = df[y_col]
    model = LinearRegression().fit(x, y)

    plt.scatter(df[x_col], df[y_col], color="purple")
    plt.plot(df[x_col], model.predict(x), color="green")
    plt.title(f"{y_col} vs {x_col}")
    plt.xlabel(x_col)
    plt.ylabel(y_col)

    out_path = Path(__file__).resolve().parent / "linear_regression_output_python.png"
    plt.savefig(out_path)
    plt.close()

    r = model.score(x, y)
    print(f"R^2 value for linear regression: {r}")
    print(f"Plot saved to {out_path}")


if __name__ == "__main__":
    main()
