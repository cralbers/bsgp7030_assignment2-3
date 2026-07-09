options(device = function() pdf(file = NULL))

# install.packages("ggplot2")
library(ggplot2)


args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 3) {
  stop("Usage: Rscript linear_regression_r.R <filename> <x_column> <y_column>")
}

# Assign function arguments to variable names 
filename <- args[1]
x_col <- args[2]
y_col <- args[3]


# import csv file into R df and assign x and y variables
data <- read.csv(filename)
formula <- as.formula(paste(y_col, "~", x_col))
model <- lm(formula, data = data)



# calculate the slope, intercept, r value, MSE, and RMSE
# and print the values to the console
slope <- coef(model)[2]
intercept <- coef(model)[1]
r <- cor(data[[x_col]], data[[y_col]])
pred <- predict(model)
mse <- mean((data[[y_col]] - pred)^2)
rmse <- sqrt(mse)   

cat("Slope for linear regression:", slope, "\n")
cat("Y-intercept for linear regression:", intercept, "\n")
cat("R value for linear regression:", r, "\n")
cat("MSE for linear regression:", mse, "\n")
cat("RMSE for linear regression:", rmse, "\n")


# graph the raw data and the calculated regression line
# and save the plot to linear_regression_r.png
plot <- ggplot(data, aes_string(x = x_col, y = y_col)) +
    geom_point(color='purple') +
    geom_smooth(method = "lm", se = FALSE, color = 'red') +
    annotate("text", x = 2, y = max(data[[y_col]]) - 5000,
             label = paste("y =", round(slope, 2), "x +", round(intercept, 2),
                           "\nr =", round(r, 2), "\nMSE =", round(mse, 2)),
             size = 6) +
    labs(title = paste(y_col, "vs", x_col), 
         x = x_col, 
         y = y_col) +
    theme_bw(base_size = 16)

ggsave("linear_regression_r.png", plot)
print(plot)

