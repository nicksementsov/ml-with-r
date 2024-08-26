# Decision Tree Regression

## Setup
setwd('~/Documents/R/2 - Regression/2 - 5 Decision Tree Regression')

### Libraries
library(caTools)
library(rpart)
library(ggplot2)

### Load Data
dataSet = read.csv('Position_Salaries.csv')
dataSet = dataSet[2:3]

## Fitting the regressor to the dataset
regressor = rpart(formula = Salary ~ .,
                  data = dataSet,
                  control = rpart.control(minsplit = 1))

## Making new predictions
y_pred = predict(regressor, data.frame(Level = 6.5))

## Visualization
x_grid = seq(min(dataSet$Level), max(dataSet$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataSet$Level, y = dataSet$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, 
                y = predict(regressor, 
                            newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Position vs Salary (decision tree regressor') +
  xlab('Position') +
  ylab('Salary')

## Plotting the tree
plot(regressor)
text(regressor)


