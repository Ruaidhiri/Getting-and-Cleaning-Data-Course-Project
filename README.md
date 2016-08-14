##Getting-and-Cleaning-Data-Course-Project

#Contents

This repo contains my submission for the Getting and Cleaning Data Course Project. It contains the following files:

* `run_analysis.R` - an R script designed to tidy the data set available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]. This script was created using RStudio version 0.99.902 with R version 3.3.0 on Windows 8.1 x64.
* `CodeBook.md` - a code book describing the functioning of the `run_analysis.R` script, its variables and outputs, as well as a description of the original data source.
* `tidy-data.txt` - a copy of the first output of the script. It is a tidy data set derived from the original data, containing only the mean and standard deviation for each measurement.
* `tidy-data-averages.txt` - a copy of the second output of the script. It is a tidy data set derived from the first output, containing the averages of each variable for each activity and each subject.

#Running the script

`run_analysis.R` can be run in R using the command `source("run_analysis.R2)`

All files will be downloaded and written to the current working directory.
