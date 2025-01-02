#' Linear Data-Generating Process
#'
#' @description Generate training and test data according to the classical
#'   linear regression model: y = X*beta + noise.
#'
#' @param n_train Number of training samples.
#' @param n_test Number of training samples.
#' @param p Number of features.
#' @param beta Coefficient vector in linear regression function.
#' @param noise_sd Standard deviation of additive noise term.
linear_dgp_fun <- function(n_train, n_test, p, beta, noise_sd) {
  n <- n_train + n_test
  X <- matrix(rnorm(n * p), nrow = n, ncol = p)
  y <- X %*% beta + rnorm(n, sd = noise_sd)
  data_list <- list(
    X_train = X[1:n_train, , drop = FALSE],
    y_train = y[1:n_train],
    X_test = X[(n_train + 1):n, , drop = FALSE],
    y_test = y[(n_train + 1):n]
  )
  return(data_list)
}
