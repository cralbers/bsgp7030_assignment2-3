#!/usr/bin/env Rscript

args <- commandArgs(trailingOnly = TRUE)

usage <- function() {
  cat("Usage: Rscript linear_regression_r.r <FILENAME> <X_COL> <Y_COL>\n", file = stderr())
}

if (length(args) != 3) {
  usage()
  quit(status = 1)
}

filename <- args[1]
x_col <- args[2]
y_col <- args[3]

library(ggplot2)

df <- read.csv(filename)
missing <- setdiff(c(x_col, y_col), names(df))
if (length(missing) > 0) {
  cat(
    paste0("Error: column(s) not found: ", paste(missing, collapse = ", "), "\n"),
    file = stderr()
  )
  quit(status = 1)
}

formula <- as.formula(paste(y_col, "~", x_col))
model <- lm(formula, data = df)

plot <- ggplot(df, aes(x = .data[[x_col]], y = .data[[y_col]])) +
  geom_point(color = "purple") +
  geom_line(aes(y = predict(model, newdata = df)), color = "red") +
  ggtitle(paste(y_col, "vs", x_col)) +
  xlab(x_col) +
  ylab(y_col) +
  theme_bw(base_size = 16)

script_dir <- dirname(normalizePath(sub("--file=(.+)", "\\1", commandArgs(trailingOnly = FALSE)[4])))
out_path <- file.path(script_dir, "linear_regression_output_r.png")
ggsave(out_path, plot = plot, width = 7, height = 5, dpi = 150)

print(summary(model))
cat("Plot saved to", out_path, "\n")
