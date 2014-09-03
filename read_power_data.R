library(sqldf)

# Read data from file and return a data frame with desired power data (from 1/2/2007 to 2/2/2007).
#
# For reading only the rows with specific dates, the sqldf package is used. This package 
# provides an easy way to read a file and filter it with an sql statement. As only the filtered
# set is processed by R, large data sets can be handled.
# Furthermore this approach is more robust than hardcoding line numbers.
#
# It is assumed that the data file "household_power_consumption.txt" is in the current working
# directory. Otherwise it will be downloaded and unzipped.

read_power_data <- function() {
  data_archive = "household_power_consumption.zip"
  data_file = "household_power_consumption.txt"
  
  # check if file does exist in working directory; if not: download and unzip
  if (!file.exists(data_file)) {
    print("Downloading data file ...")
    file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(file, destfile=data_archive)
    unzip(data_archive)
  }

  # read data for specific dates
  # Values are read as characters and then converted into date, time and numeric values.
  # This method is used to preserve NA values which would be converted to 0 otherwise.
  data <- read.csv.sql(data_file, 
                       sep=";",
                       sql="select * from file where Date = '1/2/2007' or Date = '2/2/2007'",
                       colClasses=c(rep("character", each=9)))
  
  # combine Date and Time columns into 1 column (Date) and drop Time
  data$Date <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %T")
  data <- subset(data, select=-c(Time))
  
  # convert characters to numeric value
  data[,2:8] <- lapply(data[,2:8], FUN=as.numeric)
  
  data
}