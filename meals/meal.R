# load required libraries
library(simChef)

# load all functions from R/dgp, R/method, R/eval, and R/viz
load_all()

set.seed(12345)

#### Create Experiment Components ####
## DGPs
linear_dgp <- create_dgp(
  .dgp_fun = linear_dgp_fun, .name = "Linear DGP",
  # additional named parameters to pass to .dgp_fun()
  n_train = 200, n_test = 200, p = 2, beta = c(1, 0), noise_sd = 1
)

## Methods
linear_reg <- create_method(
  .method_fun = linear_reg_fun, .name = "Linear Regression"
  # additional named parameters to pass to .method_fun()
)
rf <- create_method(
  .method_fun = rf_fun, .name = "Random Forest",
  # additional named parameters to pass to .method_fun()
  num.threads = 1
)

## Evaluators
pred_err <- create_evaluator(
  .eval_fun = summarize_pred_err, .name = 'Prediction Accuracy',
  # additional named parameters to pass to .eval_fun()
  truth_col = "y_test", estimate_col = "predictions"
)

## Visualizers
pred_err_plot <- create_visualizer(
  .viz_fun = plot_pred_err, .name = 'Prediction Accuracy Plot',
  # additional named parameters to pass to .viz_fun()
  eval_name = 'Prediction Accuracy'
)

#### Create Experiment ####
experiment <- create_experiment(name = "Example Experiment") |>
  add_dgp(linear_dgp) |>
  add_method(linear_reg) |>
  add_method(rf) |>
  add_evaluator(pred_err) |>
  add_visualizer(pred_err_plot) |>
  add_vary_across(.dgp = "Linear DGP", noise_sd = c(0.1, 0.5, 1, 2))

#### Run Experiment ####
# initialize docs
init_docs(experiment)
# run experiment
results <- run_experiment(experiment, n_reps = 100, save = TRUE)
# render docs
render_docs(experiment)
