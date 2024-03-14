# Assignment 1: Tidy data package

This repository contains R code for tidying data

## Dependencies

Make sure you have the following R packages installed:

- `tidyverse`

You can install them using the following commands:

```R
install.packages("tidyverse")
```

## Data 

### Dataset 1
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


## Results

The tidied data are stored in 'result/' directory.

## Acknowledgments
The dataset 1 provided by Dr Natalie Jones from the lab of Prof. Margie Mayfield. Information provided by Dr John Dwyer.

## Authors
This project was developed by the following individuals:
- Le Na Ngo https://github.com/lna0104

