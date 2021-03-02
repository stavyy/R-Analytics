# R-Analytics
In this assignment, you are required to use a set of functions provided by R to conduct a simple analysis on the dataset review.data  You can follow the R Data. assignment to load the data successfully. The analysis  tasks is as followed:

For each reviews, calculate the number of words used in "reviewText" and add a filed in the Data Frame (you can name it as "numsOfWords") to record the numbers for each review. 
For each "overall" level, please calculate the average numbers of words used for this level
Please use a 2D figure to show  the result of task 2, where X axis is the "overall" level and Y means the average numbers of words used for each level. 
Helper.

The following function is provided to calculate how many words in a string, so you can use it in your code. 
nwords <- function(string, pseudo=F){
      ifelse( pseudo, 
               pattern <- "\\S+", 
               pattern <- "[[:alpha:]]+" 
      )
      str_count(string, pattern)
}
For task 2 & 3, you should print out the result directly. 
