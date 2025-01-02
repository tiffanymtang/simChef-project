test_that("linear_dgp_fun works", {
  n_train <- 100
  n_test <- 50
  p <- 10
  beta <- rep(1, p)
  noise_sd <- 0

  out <- linear_dgp_fun(
    n_train = n_train,
    n_test = n_test,
    p = p,
    beta = beta,
    noise_sd = noise_sd
  )

  # check output format
  expect_true(
    all(names(out) %in% c("X_train", "y_train", "X_test", "y_test"))
  )
  # check dimensions
  expect_equal(nrow(out$X_train), n_train)
  expect_equal(ncol(out$X_train), p)
  expect_equal(length(out$y_train), n_train)
  expect_equal(nrow(out$X_test), n_test)
  expect_equal(ncol(out$X_test), p)
  expect_equal(length(out$y_test), n_test)
})
