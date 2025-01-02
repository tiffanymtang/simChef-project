# Example Simulation Project using `simChef`

This repository contains an example `simChef` project, created using `simChef::init_sim_project()`. For the sake of illustration, this example simulation project studies the performance of linear regression versus random forests under a linear data-generating process across varying noise levels.

To run the experiment, see the main *meal* script at [meals/meal.R](meals/meal.R). This script will run the simulation experiment and save the results to the `results/` directory.

Other notes on reproducibility:
- This simulation project is equipped with version control using `git`, a reproducible environment using `renv`, and unit testing using `testthat`.
- To quickly reproduce the R environment including all necessary package dependencies, run `renv::restore()` in the project directory.
- To run the unit tests, run `simChef::test_sim_dir()` in the project directory.
