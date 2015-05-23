
Getting and Cleaning Data Course Project
========================================

This Code Book describes the variables, the data, and any transformations or work that you performed to clean up the data.

[DATA]
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[VARIABLES]
trainingData = training data of the file: uci-har-dataset/train/X_train.txt
trainingLabel = training labels of the file: uci-har-dataset/train/y_train.txt
trainingSubject = training subjects of the file: uci-har-dataset/train/subject_train.txt
testData = test data of the file: uci-har-dataset/test/X_test.txt
testLabel = test labels of the file: uci-har-dataset/test/y_test.txt
testSubject = test subjects of the file: uci-har-dataset/test/subject_test.txt
joinData = a consolidated dataset of data (training + test)
joinLabel = a consolidated dataset of labels (training + test)
joinSubject = a consolidated dataset of subjects (training + test)
meanStdIndices = indices of mean or standard deviation data.
features = features of the file: uci-har-dataset/features.txt
activity = activities of the file: uci-har-dataset/activity_labels.txt
cleanedData = a combined dataset using joinData, joinLabel and joinSubject.
result = a second independent tidy data set with the average of each measurement for each activity and each subject.

[TRANSFORMATIONS OR WORK]
1. Only extract the measurements on the mean and standard deviation. 
2. Get a subset of joinData.
3. Clean the column names of the subset. 
4. Remove the "()" and "-" symbols in the names, as well as make the first letter of "mean" and "std" a capital letter "M" and "S" respectively.
5. Clean the activity names in the second column of activity. 
6. Make all names to lower cases. If the name has an underscore between letters, remove the underscore and capitalize the letter immediately after the underscore.
7. Transform the values of joinLabel according to the activity data frame.
8. Combine the joinSubject, joinLabel and joinData by column to get a new cleaned data frame. 
9. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.
10. Export this result as "1st_dataset.txt" file in current working directory.
11. Export a second independent tidy data set with the average of each measurement for each activity and each subject using the name "2nd_dataset.txt" in current working directory. 
