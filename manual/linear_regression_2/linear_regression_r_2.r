options(device = function() pdf(file = NULL))

# install.packages("ggplot2")
library(ggplot2)


# Ask user for inputs and save to variables 
cat("Enter filename: ")
filename <- readLines(con = "stdin", n = 1)
cat("Enter column name for x values: ")
x <- readLines(con = "stdin", n = 1)
cat("Enter column name for y values: ")
y <- readLines(con = "stdin", n = 1)


# import csv dataset
df <- read.csv(filename)

# # make a scatter plot of Salary (y) as a fx of YearsExperience (x)
# plot(df$x, df$y, col="purple")

# fit a linear regression model to the data (salary as a fx of years of experience)
model <- lm(df[[y]] ~ df[[x]])


# graph the raw data and the calculated regression line
ggplot() +
    geom_point(aes(x=df[[x]], y=df[[y]]), color='purple') +
    geom_line(aes(x=df[[x]], y=predict(model, newdata=df)), color='red') +
    ggtitle(paste(y, "vs", x)) +
    xlab(x) +
    ylab(y) +
    theme_bw(base_size=16)
ggsave("linear_regression_r_output_2.png")

# evaluate the model's performance 
summary(model)