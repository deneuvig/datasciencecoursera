complete <- function(directory, id = 1:332) {
  filesList <- sprintf("%s/%03d.csv", directory, id) #list.files(directory, "*.csv", full.names = TRUE)
  
  y <- do.call(rbind, lapply(filesList, function(x) { 
    pkg <- read.csv(x) 
    data.frame(cbind(pkg$ID[1],nrow(pkg[complete.cases(pkg),])))
    }))
  colnames(y) <- c("id","nobs")
  y
}