#!/usr/bin/env python3
import os
import sys

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error


def usage() -> None:
    print("Usage: python linear_regression_python.py <FILENAME> <X_COL> <Y_COL>")


def main() -> None:
    if len(sys.argv) != 4:
        usage()
        sys.exit(1)

    filename, x_col, y_col = sys.argv[1], sys.argv[2], sys.argv[3]
    df = pd.read_csv(filename)

    for column in (x_col, y_col):
        if column not in df.columns:
            print(f"Error: column '{column}' not found in {filename}")
            sys.exit(1)

    x = df[x_col].values
    y = df[y_col].values
    X = x.reshape(-1, 1)

    # Fit ordinary least squares linear regression
    model = LinearRegression()
    model.fit(X, y)

    # Extract slope (m) and intercept (b) from the fitted line y = mx + b
    intercept = model.intercept_  # b
    slope = model.coef_[0]        # m
    y_pred = model.predict(X)

    # Pearson's r and mean squared error
    r = np.corrcoef(x, y)[0, 1]
    mse = mean_squared_error(y, y_pred)

    print(f"Slope (m):              {slope:.2f}")
    print(f"Intercept (b):          {intercept:.2f}")
    print(f"Pearson's r:            {r:.4f}")
    print(f"Mean Squared Error:     {mse:.2f}")
    print(f"Equation:               y = {slope:.2f}x + {intercept:.2f}")

    x_line = np.sort(x)
    y_line = model.predict(x_line.reshape(-1, 1))
    annotation = f"y = {slope:.2f}x + {intercept:.2f}\nr = {r:.4f}"

    plt.figure(figsize=(8, 5))
    plt.scatter(x, y, color="steelblue", edgecolors="white", label="Observed")
    plt.plot(x_line, y_line, color="crimson", linewidth=2, label="Regression line")
    plt.xlabel(x_col)
    plt.ylabel(y_col)
    plt.title(f"{y_col} vs {x_col} with Regression Line")
    # Place equation and r in the upper-left corner of the plot
    plt.text(
        0.05,
        0.95,
        annotation,
        transform=plt.gca().transAxes,
        verticalalignment="top",
        fontsize=11,
        bbox=dict(boxstyle="round", facecolor="white", alpha=0.85, edgecolor="gray"),
    )
    plt.legend(loc="lower right")
    plt.grid(True, alpha=0.3)
    plt.tight_layout()

    output_path = os.path.join(
        os.path.dirname(os.path.abspath(__file__)),
        "linear_regression_output_python.png",
    )
    plt.savefig(output_path, dpi=150)
    plt.close()
    print(f"Plot saved to {output_path}")


if __name__ == "__main__":
    main()
