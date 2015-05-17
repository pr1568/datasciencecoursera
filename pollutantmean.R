#pollutant <- "sulfate"
pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Setting the final data directory where all CSV file stored and then list the files
  ## with complete path information
  
  datadirectory <- paste(getwd(),directory,sep="/")
  
  y <- list.files(datadirectory,full.names = TRUE)
  ## Initialize a empty matrix of 4 Columns as our Data is matrix of 4 columns
  
  initMData <- matrix(NA,0,4)
  
  ## Iterate in FOR loop till we reach all limits defined in id field vector
  
  for ( i in id){
    ## reading each file in the directory and load the data in data frame
    indData = read.csv(y[i],header=TRUE)
    ## Append the data frame in the loop till the defined value of iterator
    initMData <- rbind(initMData, indData)
  }
  ## mean of passed value of pollutant and removing the NA from data frame
  mean(initMData[,pollutant],na.rm = TRUE)
}
