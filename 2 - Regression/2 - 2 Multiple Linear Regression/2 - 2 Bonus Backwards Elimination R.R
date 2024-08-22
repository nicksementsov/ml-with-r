# Backwards Elimination

## Setup, Library Import, Data Load
library(caTools)
set.seed(123)
setwd('~/Documents/R/2 - Regression/2 - 2 Multiple Linear Regression')
dataSet = read.csv('50_Startups.csv')

## Encoding Categorical Data
dataSet$State = factor(dataSet$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

## Creating the Training & Test Sets
split = sample.split(dataSet$Profit, SplitRatio = 0.8)
training_set = subset(dataSet, split == TRUE)
test_set = subset(dataSet, split == FALSE)

## Training the Model on the Training Set
regressor = lm(formula = Profit ~ .,
               data = training_set)

## Making Predictions with the Test Set
y = predict(regressor, newdata = test_set)

## Optimizing the Model with Backwards Elimination
regressor = lm(formula = Profit ~ R.D.Spend +
                 Administration +
                 Marketing.Spend +
                 State,
               data = dataSet)
y = predict(regressor, newdata = test_set)

## Optimized Model:
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataSet)
summary(regressor)
y = predict(regressor, newdata = test_set)
y
