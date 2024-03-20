### Assignment 1: Tidy data package
# Load library ------
library(tidyverse)
library(dplyr)

rm(list=ls())

# Set working directory
tmp <- getwd()
setwd(substr(tmp, 1, nchar(tmp)-4))

# Load data -----
nameList <- c("PJ Sun 1 tiny tag 1 daily min max", "PJ Shade 1 tiny tag 1 daily min max", "PJ Shade 1 tiny tag 2 daily min max") 
resultList <- list()
for (dataName in nameList) {
  # Read CSV file
  rawData <- read_csv(paste0("data/", dataName, ".csv"))
  # Rename columns
  colnames(rawData) <- c("Date", "minTemp", "maxTemp", "minHumid", "maxHumid", "minDewPoint", "maxDewPoint")
  
  # Process the date data
  dateData <- rawData["Date"]  %>%
    # Convert Date column into D1, D2 and D3
    separate(Date, into = c("D1", "D2", "D3")) %>%
    # Select the right day column based on max value of column
    mutate(Day = if(max(as.numeric(D1)) > 12) D1 else D2) %>% 
    mutate(Month = ifelse(Day==D1, D2, D1)) %>%
    # Convert all year values to YYYY format
    rowwise() %>% 
    mutate(Year = ifelse(as.numeric(D3) < 2000, paste0("20", D3), D3)) %>%
    select(c("Day","Month","Year"))
  
  #Process the min max data
  minMaxData <- rawData[-1] %>%
    # Use strsplit to get only the number value from columns starting with "min" or "max"
    mutate(across(starts_with("min") | starts_with("max"), 
                  ~ as.numeric(sapply(strsplit(as.character(.), " ", useBytes = TRUE), function(x) x[1]))))
  
  # Combine both processed data and pivot_longer
  tidyData <- cbind(dateData, minMaxData) %>%
    pivot_longer(cols = 4:9, names_to = "Measure", values_to = "Value")
  
  # Add tidyData to resultList
  resultList <- c(resultList, list(tidyData))
}

# Combine all results into a single data frame
resultData <- reduce(resultList, bind_rows)
# Write to csv file
write.csv(resultData, "result/tidy_dataset_1.csv", row.names = FALSE)

