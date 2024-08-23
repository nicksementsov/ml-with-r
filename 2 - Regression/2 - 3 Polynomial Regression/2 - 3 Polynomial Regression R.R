# Polynomial Regression

## Setup
setwd('~/Documents/R/2 - Regression/2 - 3 Polynomial Regression')
library(caTools)
library(ggplot2)
set.seed(123)
dataSet = read.csv('Position_Salaries.csv')
dataSet = dataSet[2:3]

## Creating Training & Testing Sets
split = sample.split(dataSet$Salary, SplitRatio = 2/3)
training_set = subset(dataSet, split == TRUE)
test_set = subset(dataSet, split == FALSE)

## Fit Linear Regressor to dataSet
lin_reg = lm(formula = Salary ~ .,
             data = dataSet)

## Fit Polynomial Regressor to dataSet
dataSet$Level2 = dataSet$Level^2
dataSet$Level3 = dataSet$Level^3
dataSet$Level4 = dataSet$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataSet)

## Visualizing the Linear Regressor
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = dataSet$Level, y = predict(lin_reg, newdata = dataSet)),
            colour = 'blue') +
  ggtitle('Position vs Salary (linear regression)') +
  xlab('Level') +
  ylab('Salary')

## Visualizing the Polynomial Regressor
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = dataSet$Level, y = predict(poly_reg, newdata = dataSet)),
            colour = 'blue') +
  ggtitle('Position vs Salary (polynomial regression)') +
  xlab('Level') +
  ylab('Salary')

## Improving Polynomial Visualization Quality
x_grid = seq(min(dataSet$Level), max(dataSet$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(poly_reg,
                                        newdata = data.frame(Level = x_grid,
                                                             Level2 = x_grid^2,
                                                             Level3 = x_grid^3,
                                                             Level4 = x_grid^4))),
            colour = 'blue') +
  ggtitle('Position vs Salary (polynomial regression') +
  xlab('Position') +
  ylab('Salary')

## Predicting new results with the Linear Regressor
predict(lin_reg, data.frame(Level = 6.5))

## Predicting new results with the Polynomial Regressor
predict(poly_reg, data.frame(Level = 6.5,
                             Level2 = 6.5^2,
                             Level3 = 6.5^3,
                             Level4 = 6.5^4))







