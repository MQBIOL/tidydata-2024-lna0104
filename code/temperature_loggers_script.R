### Assignment 1: Tidy data package
# Load library ------
library(tidyverse)

# Load data -----
rm(list=ls())
nameList <- c("PJ Sun 1 tiny tag 1 daily min max", "PJ Shade 1 tiny tag 1 daily min max", "PJ Shade 1 tiny tag 2 daily min max") 
resultList <- list()

for (dataName in nameList) {
  # Read CSV file
  rawData <- read_csv(paste0("data/", dataName, ".csv"))
  # Rename columns
  colnames(rawData) <- c("Date", "minTemp", "maxTemp", "minHumid", "maxHumid", "minDewPoint", "maxDewPoint")
  
  tidyData <- rawData %>%
    # Convert Date column into Day, Month, and Year
    separate(Date, into = c("Day", "Month", "Year"))  %>% 
    # Use strsplit to get only the number value from columns starting with "min" or "max"
    mutate(across(starts_with("min") | starts_with("max"), 
                  ~ as.numeric(sapply(strsplit(as.character(.), " ", useBytes = TRUE), function(x) x[1])))) %>%
    pivot_longer(cols = 4:9, names_to = "Measure", values_to = "Value")
  
  # Add tidyData to resultList
  resultList <- c(resultList, list(tidyData))
}

# Combine all results into a single data frame
resultData <- reduce(resultList, bind_rows)
# Write to csv file
write.csv(resultData, "result/tidy_dataset_1.csv", row.names = FALSE)

