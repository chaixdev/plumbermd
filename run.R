library(plumber)
r <- plumb("api.R")
r$run(port=80, host="0.0.0.0")