# Simple Linear Regression

## Setup & Load
library(caTools)
library(ggplot2)
setwd("~/Documents/R/2 - Regression/2 - 1 Simple Linear Regression")
dataSet = read.csv('Salary_Data.csv')

## Training & Test Set
set.seed(123)
split = sample.split(dataSet$Salary, SplitRatio = 2/3)
training_set = subset(dataSet, split == TRUE)
test_set = subset(dataSet, split == FALSE)

## Fitting the Simple Linear Regressor to the Training Set
### Salary proportional to Years of Experience
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

## Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

## Visualizing Training Set Results
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Years of Experience (training set)') +
  xlab('Years of Experience') +
  ylab('Salary')

## Visualizing Test Set Results
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Years of Experience (test set)') +
  xlab('Years of Experience') +
  ylab('Salary')
