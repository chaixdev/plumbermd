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
echo <- function(res) {
  include_rmd("example-r-markdown.rmd", res,format = NULL)
}

#* post a csv
#* @post /postcsv
postcsv <- function(req,res) {
  
  data <- req$body
  csvfile = read.csv(text=data,sep = ",", fileEncoding = "utf-8")
  print(csvfile)

  # list(csvfile)
  include_html(rmarkdown::render("wotmania.rmd", params = list(data = data)), res)
  
}
