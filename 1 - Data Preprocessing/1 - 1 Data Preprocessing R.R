# Data Preprocessing

## Libraries
library(caTools)

## Import Data
dataSet = read.csv('Data.csv')

## Handling Missing Data
dataSet$Age = ifelse(is.na(dataSet$Age),
                     ave(dataSet$Age,FUN = function(x) mean(x, na.rm = TRUE)),
                     dataSet$Age)

dataSet$Salary = ifelse(is.na(dataSet$Salary),
                        ave(dataSet$Salary,FUN = function(x) mean(x, na.rm = TRUE)),
                        dataSet$Salary)

## Encoding Categorical Data
dataSet$Country = factor(dataSet$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))

dataSet$Purchased = factor(dataSet$Purchased,
                           levels = c('No', 'Yes'),
                           labels = c(0, 1))

## Creating the Training and Test Sets
set.seed(123)

split = sample.split(dataSet$Purchased, SplitRatio = 0.8)

training_set = subset(dataSet, split == TRUE)
test_set = subset(dataSet, split == FALSE)

## Feature Scaling
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])
