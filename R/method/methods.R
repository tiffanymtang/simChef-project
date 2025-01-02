#' Linear Regression Method
#'
#' @param X_train Training data matrix.
#' @param y_train Training response vector.
#' @param X_test Test data matrix.
#' @param y_test Test response vector.
linear_reg_fun <- function(X_train, y_train, X_test, y_test) {
  train_df <- dplyr::bind_cols(data.frame(X_train), y = y_train)
  fit <- lm(y ~ ., data = train_df)
  predictions <- predict(fit, data.frame(X_test))
  return(list(predictions = predictions, y_test = y_test))
}

#' Random Forest Method
#'
#' @param X_train Training data matrix.
#' @param y_train Training response vector.
#' @param X_test Test data matrix.
#' @param y_test Test response vector.
#' @param ... Additional arguments to pass to `ranger::ranger()`
rf_fun <- function(X_train, y_train, X_test, y_test, ...) {
  train_df <- dplyr::bind_cols(data.frame(X_train), y = y_train)
  fit <- ranger::ranger(y ~ ., data = train_df, ...)
  predictions <- predict(fit, data.frame(X_test))$predictions
  return(list(predictions = predictions, y_test = y_test))
}
