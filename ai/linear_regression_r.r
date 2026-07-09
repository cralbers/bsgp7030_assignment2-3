#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) {
  stop("Usage: Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>")
}

filename <- args[1]
x_col <- args[2]
y_col <- args[3]

if (!file.exists(filename)) {
  stop(sprintf("Error: file '%s' not found", filename))
}

suppressPackageStartupMessages(library(ggplot2))

df <- read.csv(filename, stringsAsFactors = FALSE)

for (column in c(x_col, y_col)) {
  if (!column %in% names(df)) {
    stop(sprintf("Error: column '%s' not found in %s", column, filename))
  }
}

# Fit ordinary least squares
model <- lm(as.formula(paste(y_col, "~", x_col)), data = df)

# Extract intercept (b) and slope (m) from the fitted line y = mx + b
intercept <- coef(model)[1]  # b
slope <- coef(model)[2]      # m
y <- df[[y_col]]
y_pred <- predict(model, df)

# Pearson's r and mean squared error
r <- cor(df[[x_col]], df[[y_col]])
mse <- mean((y - y_pred)^2)

cat(sprintf("Slope (m):              %.2f\n", slope))
cat(sprintf("Intercept (b):          %.2f\n", intercept))
cat(sprintf("Pearson's r:            %.4f\n", r))
cat(sprintf("Mean Squared Error:     %.2f\n", mse))
cat(sprintf("Equation:               y = %.2fx + %.2f\n", slope, intercept))

# Annotation text: fitted equation and correlation
annotation <- sprintf("y = %.2fx + %.2f\nr = %.4f", slope, intercept, r)

plot <- ggplot(df, aes(x = .data[[x_col]], y = .data[[y_col]])) +
  geom_point(color = "steelblue", size = 3) +
  geom_abline(intercept = intercept, slope = slope, color = "#DC143C", linewidth = 1) +
  annotate(
    "label",
    x = min(df[[x_col]]),
    y = max(df[[y_col]]),
    label = annotation,
    hjust = 0,
    vjust = 1,
    size = 3.8,
    fill = "white",
    linewidth = 0.3,
    alpha = 0.9
  ) +
  labs(
    x = x_col,
    y = y_col,
    title = paste(y_col, "vs", x_col, "with Regression Line")
  ) +
  theme_minimal()

script_dir <- dirname(normalizePath(sub("--file=", "", commandArgs(trailingOnly = FALSE)[grep("--file=", commandArgs(trailingOnly = FALSE))])))
output_path <- file.path(script_dir, "linear_regression_output_r.png")

ggsave(output_path, plot = plot, width = 8, height = 5, dpi = 150)
cat(sprintf("Plot saved to %s\n", output_path))
