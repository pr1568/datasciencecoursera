#directory <- "/Users/rgupta/coursera/datasciencecoursera/specdata"
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## Setting the final data directory where all CSV file stored and then list the files
  ## with complete path information
  
  datadirectory <- paste(getwd(),directory,sep="/")
  
  y <- list.files(datadirectory,full.names = TRUE)
  ## initialize the nobs as numeric
  nobs = numeric()
  
  ## Iterate in FOR loop till we reach all limits defined in id field vector
  for ( i in id){
    ## completing the full path of file using paste function and read the data using read.csv
    fileRead = read.csv(y[i])
    ## get the sum of complete cases
    nobs = c(nobs, sum(complete.cases(fileRead)))
  }
  return(data.frame(id,nobs))
}