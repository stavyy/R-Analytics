library(jsonlite)
library(stringr)
library(ggplot2)
# There are two ways to load data and parse it as dataframe

# load the input file into memory one time, than using some transformations on matrix
# and aggregated operations such as "sapply" to build the dataframe.
loadDataOneTime <- function(){
  oldpath <- getwd()
  datapath <- "review.data"
  lines <- readLines(datapath)
  jsonData <- as.data.frame(t(sapply(lines, fromJSON)))
  rownames(jsonData) <- c()
  jsonData <- transform(jsonData, overall = as.numeric(overall))
  setwd(oldpath)
  return(jsonData)
}

# (GIVEN) Calculate how many words in a string
nwords <- function(string, pseudo=F){
  ifelse( pseudo,
          pattern <- "\\S+",
          pattern <- "[[:alpha:]]+"
  )
  str_count(string, pattern)
}

data <- loadDataOneTime()

# 1
data$numsOfWords <- sapply(data$reviewText, nwords)


# 2
data$overall <- factor(data$overall)
data1 <- with(data, tapply(numsOfWords, overall, mean))
data2 <- with(data, aggregate(numsOfWords~overall, FUN=mean))

# 3

attach(data2)
data3 <- plot(overall,numsOfWords, type="l")
detach(data2)

