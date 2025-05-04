library(tidyverse)
library(caret)

## load data
mtcars
tibble(mtcars)
head(mtcars)

## split data 70:30
set.seed(42)
n <- nrow(mtcars) ## total = 32
id <- sample(1:n,size = 0.7*n)

# subset
train_df <- mtcars[id,]
test_df <- mtcars[-id,]

## train a linear regression model "lm"
set.seed(42)
lm_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "lm")
lm_model
lm_model$resample

## train KNN model
knn_model <- train(mpg ~ hp + wt + am,
                  data = train_df,
                  method = "knn")
knn_model
## score

p_test <- predict(lm_model, newdata = test_df)
p_test_knn <- predict(knn_model, newdata = test_df)

## evaluate MAE, MSE, RMSE
error <- test_df$mpg - p_test
error_knn <- test_df$mpg - p_test_knn
mae <- mean(abs(error))
mae_knn <- mean(abs(error_knn))
mse <- mean(error**2)
rmse <- sqrt(mean(error**2))
mae
mae_knn
mse
rmse
list(mae, mse, rmse)

