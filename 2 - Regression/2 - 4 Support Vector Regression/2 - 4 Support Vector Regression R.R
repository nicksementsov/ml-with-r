# Support Vector Regression

## Setup
setwd('~/Documents/R/2 - Regression/2 - 4 Support Vector Regression')
library(e1071)
library(ggplot2)

## Data Load
dataSet = read.csv('Position_Salaries.csv')
dataSet = dataSet[2:3]

## Fitting Regressor to the dataset
regressor = svm(formula = Salary ~ .,
                data = dataSet,
                type = 'eps-regression',
                kernel = 'radial')

## Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

## Visualization
### Visualization
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = dataSet$Level, y = predict(regressor, 
                                               newdata = dataSet)),
            colour = 'blue') +
  ggtitle('Salary vs Position (support vector regression') +
  xlab('Position') +
  ylab('Salary')

### Visualization quality improvement
x_grid = seq(min(dataSet$Level), max(dataSet$Level), 0.1)
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, 
                y = predict(regressor, newdata = data.frame(Level = x_grid))), 
            colour = 'blue') +
  ggtitle('Salary vs Position (support vector regression') +
  xlab('Position') +
  ylab('Salary')
