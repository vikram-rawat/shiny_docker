# plumber.R

# load libraries: ----------------------------------
library(plumber)

# section: ----------------------------------
api <- plumb("api/routes/entrypoint.R")

api |>
  pr_run(port = 8000)
