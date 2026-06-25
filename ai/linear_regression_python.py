#!/usr/bin/env python3
import os
import sys

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score


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

    model = LinearRegression()
    model.fit(X, y)

    intercept = model.intercept_
    slope = model.coef_[0]
    y_pred = model.predict(X)
    residuals = y - y_pred
    n = len(y)

    r2 = r2_score(y, y_pred)
    rmse = np.sqrt(mean_squared_error(y, y_pred))
    mae = mean_absolute_error(y, y_pred)
    residual_se = np.sqrt(np.sum(residuals**2) / (n - 2))

    print(f"Intercept: {intercept:.2f}")
    print(f"Slope: {slope:.2f}")
    print(f"Regression equation: {y_col} = {intercept:.2f} + {slope:.2f} * {x_col}")
    print("Model Performance")
    print("-----------------")
    print(f"R-squared:              {r2:.4f}")
    print(f"RMSE:                   {rmse:.2f}")
    print(f"MAE:                    {mae:.2f}")
    print(f"Residual Std. Error:    {residual_se:.2f}")

    x_line = np.sort(x)
    y_line = model.predict(x_line.reshape(-1, 1))

    plt.figure(figsize=(8, 5))
    plt.scatter(x, y, color="steelblue", edgecolors="white", label="Observed")
    plt.plot(x_line, y_line, color="crimson", linewidth=2, label="Regression line")
    plt.xlabel(x_col)
    plt.ylabel(y_col)
    plt.title(f"{y_col} vs {x_col} with Regression Line")
    plt.legend()
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
