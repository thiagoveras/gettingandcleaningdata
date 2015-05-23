Getting and Cleaning Data Course Project
========================================

The objective of this project is:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This file describes how run_analysis.R script can be used to achieve this objective.
The repository https://github.com/thiagoveras/gettingandcleaningdata/ contains one folder and five files as described below:

[uci-har-dataset]: this folder contains the raw data of the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. This folder is very important when you will execute the script.

[README.md]: this file.

[CodeBook.md]: the code book that describes the variables, the data, and any transformations or work that you performed to clean up the data.
[run_analysis.R]: the main file, the code script. To use this script, you will need to execute the commands below:
source("run_analysis.R")
run_analysis()
if everything ok, you will receive two messages:
exported the first dataset: 1st_dataset.txt
exported the second dataset: 2nd_dataset.txt

[1st_dataset.txt]: Appropriately labels the data set with descriptive variable names. (Step 4 of the project)

[2nd_dataset.txt]: Independent tidy data set with the average of each variable for each activity and each subject (Step 5 of the project)

*** OBS: The workspace is setted to "~/CESAR/BIGDATA/gettingandcleaningdata". If you want to use other one, please change the line 4 of the script with your destination. Otherwise, you need to guarantee that the [uci-har-dataset] is in the same folder of [run_analysis.R]. 
