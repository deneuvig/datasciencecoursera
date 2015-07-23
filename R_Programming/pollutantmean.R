pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  filesList <- sprintf("%s/%03d.csv", directory, id) #list.files(directory, "*.csv", full.names = TRUE)
  allData <- do.call(rbind , lapply(filesList, read.csv))
  
  mean(allData[,pollutant],na.rm=TRUE)
 
}

