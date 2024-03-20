# Assignment 1: Tidy data package

This repository contains R code for tidying data.

R version R version 4.3.1 (2023-06-16) was used for all code contained within this repository.


## Dependencies

Make sure you have the following R packages installed:

- `tidyverse`
- `dplyr`

You can install them using the following commands:

```R
install.packages("tidyverse")
install.packages("dplyr")
```

## Data 

The data used in this project are stored in the 'data/' directory. The file names are:

- PJ Sun 1 tiny tag 1 daily min max.csv
- PJ Shade 1 tiny tag 1 daily min max.csv
- PJ Shade 1 tiny tag 2 daily min max.csv

These input files include one row per measurement day. For each day the minimum and maximum values of various climate variables were recorded. 
- Each file contains 7 columns:
1.	Date: date format varies (“month/day/year” OR “day/month/year”)
2.	Min: minimum temperature (ºC)
3.	Max: maximum temperature (ºC)
4.	Min: minimum relative humidity (%RH)
5.	Max: maximum relative humidity (%RH)
6.	Min: minimum dew point (ºC)
7.	Max: maximum dew point (ºC)

“PJ Shade 1 tiny tag 1 daily min max.csv” includes the data for the first logger deployed in the shaded site at West Perenjori Nature Reserve from 19th October 2019 to 15th January 2021. Date was recorded as “month/day/year” format. 

“PJ Shade 1 tiny tag 2 daily min max.csv” includes the data for the second logger deployed in the shaded site at West Perenjori Nature Reserve from 19th July 2019 to 15th January 2021. Date was recorded as “month/day/year” format.

“PJ Sun 1 tiny tag 1 daily min max.csv” includes the data for the first logger deployed in the sunny site at West Perenjori Nature Reserve from 19th July 2019 to 15th January 2021. There was only one logger deployed in this site. Date was recorded as “day/month/year” format.


## Result

The tidied data are stored in 'result/' directory.

Each file in this directory contains the following columns:

- Day: Represented in the form DD.
- Month: Represented in the form MM.
- Year: Represented in the form YYYY.
- Measure: Indicates one of the following measurements: "minTemp" for minimum temperature (ºC), "maxTemp" for maximum temperature (ºC), "minHumid" for minimum relative humidity (%RH), "maxHumid" for maximum relative humidity (%RH), "minDewPoint" for minimum dew point (ºC), or "maxDewPoint" for maximum dew point (ºC).
- Value: Indicates the recorded value of the corresponding measurement.
- Unit: Indicates the unit of measurement.

## Acknowledgments
The dataset 1 provided by Dr Natalie Jones from the lab of Prof. Margie Mayfield. Information provided by Dr John Dwyer.

## Authors
This project was developed by:
- Le Na Ngo https://github.com/lna0104

