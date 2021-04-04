library(rmarkdown)

# plumber.R

#' @filter cors
cors <- function(req, res) {
  
  res$setHeader("Access-Control-Allow-Origin", "*")
  
  if (req$REQUEST_METHOD == "OPTIONS") {
    res$setHeader("Access-Control-Allow-Methods","*")
    res$setHeader("Access-Control-Allow-Headers", req$HTTP_ACCESS_CONTROL_REQUEST_HEADERS)
    res$status <- 200 
    return(list())
  } else {
    plumber::forward()
  }
}

#* Echo back the input
#* @get /rmd
function(req,res) {

  include_rmd("example-r-markdown.rmd", res,format = NULL)
}

#* post a csv
#* @post /postcsv
function(req,res) {
  
  data <- req$body

  # list(csvfile)
  include_html(rmarkdown::render("example-csv-input.rmd", params = list(data = data)), res)
  
}

# CRUD

# Read   (HTTP GET)
# Create (HTTP POST)
# Update (HTTP PUT)
# Delete (HTTP DELETE) 
