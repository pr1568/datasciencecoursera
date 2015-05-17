#directory <- "/Users/rgupta/coursera/datasciencecoursera/specdata"
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
  
  ## Setting the final data directory where all CSV file stored and then list the files
  ## with complete path information
  
  datadirectory <- paste(getwd(),directory,sep="/")
  
  y <- list.files(datadirectory,full.names = TRUE)
  ## call the complete function on the working directory to get completed data frame
  completeDataFrame = complete(directory)
  ## filter the data frame according to threshold criteria
  filterIds = completeDataFrame[completeDataFrame["nobs"] > threshold, ]$id
  ## initialize the final correlated data for output
  corrdata = numeric()
  for ( i in filterIds ){
    ## completing the full path of file using paste function and read the data using read.csv
    fileRead = read.csv(y[i])
    completeDataFrame = fileRead[complete.cases(fileRead),]
    ## get the correlation 
    corrdata = c(corrdata, cor(completeDataFrame$sulfate,completeDataFrame$nitrate ))
  }
  
  return(corrdata)
}