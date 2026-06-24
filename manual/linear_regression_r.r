install.packages("ggplot2")
library(ggplot2)

# import csv dataset
df <- read.csv("regression_data.csv")


# make a scatter plot of Salary (y) as a fx of YearsExperience (x)
plot(df$YearsExperience, df$Salary, col="purple")

# fit a linear regression model to the data (salary as a fx of years of experience)
model <- lm(Salary ~ YearsExperience, data=df)


# graph the raw data and the calculated regression line
ggplot() +
    geom_point(aes(x=df$YearsExperience, y=df$Salary), color='purple') +
    geom_line(aes(x=df$YearsExperience, y=predict(model, newdata=df)), color='red') +
    ggtitle("Salary vs Experience") +
    xlab("Years of Experience") +
    ylab("Salary") +
    theme_bw(base_size=16)


# evaluate the model's performance 
summary(model)