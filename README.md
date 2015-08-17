# Getting-and-Cleaning-Data-Project
Course project for the Coursera course "Getting and Cleaning Data"

The following data must be downloaded to your working directory.  Do not re-name
the file folder.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

run_analysis.R does the following:
 
Reads the relevant files into variables.
Merges the test and training data together
Creates subject and activity columns
Scrapes variable names and plops that on "top" of the data.
Removes all the columns without "mean()" or "std()" in the names
Makes the activities human-readable
Makes the column names human-readable
Creates the final output and loads it into "tidydata.txt" within your working directory.
