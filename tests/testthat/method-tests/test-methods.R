test_that("linear_reg_fun works", {
  # generate data
  n_train <- 100
  n_test <- 50
  p <- 10
  beta <- rep(1, p)
  noise_sd <- 0
  data_list <- linear_dgp_fun(
    n_train = n_train,
    n_test = n_test,
    p = p,
    beta = beta,
    noise_sd = noise_sd
  )

  out <- linear_reg_fun(
    X_train = data_list$X_train,
    y_train = data_list$y_train,
    X_test = data_list$X_test,
    y_test = data_list$y_test
  )
  # check output format
  expect_true(
    all(names(out) %in% c("predictions", "y_test"))
  )
  expect_equal(out$y_test, data_list$y_test)

  # check dimensions
  expect_equal(length(out$predictions), n_test)
})

test_that("rf_fun works", {
  # generate data
  n_train <- 100
  n_test <- 50
  p <- 10
  beta <- rep(1, p)
  noise_sd <- 0
  data_list <- linear_dgp_fun(
    n_train = n_train,
    n_test = n_test,
    p = p,
    beta = beta,
    noise_sd = noise_sd
  )

  out <- rf_fun(
    X_train = data_list$X_train,
    y_train = data_list$y_train,
    X_test = data_list$X_test,
    y_test = data_list$y_test
  )
  # check output format
  expect_true(
    all(names(out) %in% c("predictions", "y_test"))
  )
  expect_equal(out$y_test, data_list$y_test)

  # check dimensions
  expect_equal(length(out$predictions), n_test)
})
