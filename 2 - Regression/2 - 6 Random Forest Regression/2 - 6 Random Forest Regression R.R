# Random Forest Regression

## Setup
setwd('~/Documents/R/2 - Regression/2 - 6 Random Forest Regression')

## Libraries
library(randomForest)
library(ggplot2)

## Load data
dataSet = read.csv('Position_Salaries.csv')
dataSet = dataSet[2:3]

## Fitting the Model
set.seed(1234)
regressor = randomForest(x = dataSet[-2],
                         y = dataSet$Salary,
                         ntree = 500)

## Making predictions
y_pred = predict(regressor, data.frame(Level = 6.5))

## Visualization
x_grid = seq(min(dataSet$Level), max(dataSet$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, 
                y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Position vs Salary (random forest regression') +
  xlab('Position') +
  ylab('Salary')
  