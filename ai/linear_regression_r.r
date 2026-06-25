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

model <- lm(as.formula(paste(y_col, "~", x_col)), data = df)

intercept <- coef(model)[1]
slope <- coef(model)[2]
y <- df[[y_col]]
y_pred <- predict(model, df)
residuals <- y - y_pred
n <- length(y)

r2 <- summary(model)$r.squared
rmse <- sqrt(mean((y - y_pred)^2))
mae <- mean(abs(y - y_pred))
residual_se <- sqrt(sum(residuals^2) / (n - 2))

cat(sprintf("Intercept: %.2f\n", intercept))
cat(sprintf("Slope: %.2f\n", slope))
cat(sprintf("Regression equation: %s = %.2f + %.2f * %s\n", y_col, intercept, slope, x_col))
cat("Model Performance\n")
cat("-----------------\n")
cat(sprintf("R-squared:              %.4f\n", r2))
cat(sprintf("RMSE:                   %.2f\n", rmse))
cat(sprintf("MAE:                    %.2f\n", mae))
cat(sprintf("Residual Std. Error:    %.2f\n", residual_se))

plot <- ggplot(df, aes(x = .data[[x_col]], y = .data[[y_col]])) +
  geom_point(color = "steelblue", size = 3) +
  geom_abline(intercept = intercept, slope = slope, color = "#DC143C", linewidth = 1) +
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
