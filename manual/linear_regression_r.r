install.packages("ggplot2")
library(ggplot2)


# Ask user for inputs and save to variables 
filename <- readline(prompt = "Enter filename: ")
x = readline(prompt = "Enter column name for x values: ")
y = readline(prompt = "Enter column name for y values: ")

# import csv dataset
df <- read.csv(filename)

# make a scatter plot of Salary (y) as a fx of YearsExperience (x)
plot(df$x, df$y, col="purple")

# fit a linear regression model to the data (salary as a fx of years of experience)
model <- lm(y ~ x, data=df)


# graph the raw data and the calculated regression line
ggplot() +
    geom_point(aes(x=df$x, y=df$y), color='purple') +
    geom_line(aes(x=df$x, y=predict(model, newdata=df)), color='red') +
    ggtitle("Salary vs Experience") +
    xlab("Years of Experience") +
    ylab("Salary") +
    theme_bw(base_size=16)


# evaluate the model's performance 
summary(model)