# Getting and Cleaning Data - Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Instructions

1. Download the data source from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
2. Unzip the file and extract the folder `UCI HAR Dataset`
3. Set the parent folder of `UCI HAR Dataset` as your working directory in R
3. Download `run_analysis.R` from this repository onto you working directory
4. Source the 'run_analysis.R' file and its ready for use

## Sample Output

* source('run_analysis.R')
* myfunctions <- RunAnalysisHelper("UCI HAR Dataset")
* myfunctions$writeTidyData("tidytest.txt")

