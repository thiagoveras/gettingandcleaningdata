run_analysis <- function() 
{   
    # Precondition: Setting the working directory
    setwd("~/CESAR/BIGDATA/gettingandcleaningdata")
    
    # Step 01: Getting the data of trainning.
    ## X_train.txt
    trainingData <- read.table("./uci-har-dataset/train/X_train.txt")
    dim(trainingData) 
    head(trainingData)
    ## y_traing.txt
    trainingLabel <- read.table("./uci-har-dataset/train/y_train.txt")
    table(trainingLabel)
    ## subject_train.txt
    trainingSubject <- read.table("./uci-har-dataset/train/subject_train.txt")
    
    # Step 02: Getting the data of test.
    ## X_test.txt
    testData <- read.table("./uci-har-dataset/test/X_test.txt")
    dim(testData)
    head(testData)
    ## y_test.txt
    testLabel <- read.table("./uci-har-dataset/test/y_test.txt")
    table(testLabel)
    ## subject_test.txt
    testSubject <- read.table("./uci-har-dataset/test/subject_test.txt")
    
    # Step 03: Joining the data set of training and test (consolidating the data)
    ## Data
    joinData <- rbind(trainingData, testData)
    dim(joinData)
    ## Label
    joinLabel <- rbind(trainingLabel, testLabel)
    dim(joinLabel) 
    ## Subject
    joinSubject <- rbind(trainingSubject, testSubject)
    dim(joinSubject) 
    
    # Step 04: Getting the features. 
    features <- read.table("./uci-har-dataset/features.txt")
    dim(features)
    
    # Step 05: Extracting mean and standard deviation.
    meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features[, 2])
    length(meanStdIndices)
    joinData <- joinData[, meanStdIndices]
    dim(joinData) 
    names(joinData) <- gsub("\\(\\)", "", features[meanStdIndices, 2]) # removing parenteses
    names(joinData) <- gsub("mean", "Mean", names(joinData)) # capitalizing the first letter M
    names(joinData) <- gsub("std", "Std", names(joinData)) # capitalizing the first letter S
    names(joinData) <- gsub("-", "", names(joinData)) # removing hifen in column names
    
    # Step 06: Using activity labels to describe the activities in data set
    activity <- read.table("./uci-har-dataset/activity_labels.txt")
    activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
    substr(activity[2, 2], 8, 8) <- toupper(substr(activity[2, 2], 8, 8))
    substr(activity[3, 2], 8, 8) <- toupper(substr(activity[3, 2], 8, 8))
    activityLabel <- activity[joinLabel[, 1], 2]
    joinLabel[, 1] <- activityLabel
    names(joinLabel) <- "activity"
    names(joinSubject) <- "subject"
    
    # Step 07: Creating the 1st data set.
    cleanedData <- cbind(joinSubject, joinLabel, joinData)
    dim(cleanedData) 
    write.table(cleanedData, "1st_dataset.txt") # writing the 1st data set
    message("exported the first dataset: 1st_dataset.txt")
    
    # Step 08: Creating the 2nd dataset with a independent tidy data set with the average of each variable for each activity and each subject.
    subjectLength <- length(table(joinSubject)) 
    activityLength <- dim(activity)[1] 
    columnLength <- dim(cleanedData)[2]
    result <- matrix(NA, nrow=subjectLength*activityLength, ncol=columnLength)
    result <- as.data.frame(result)
    colnames(result) <- colnames(cleanedData)
    row <- 1
    for(x in 1:subjectLength) {
        for(y in 1:activityLength) {
            result[row, 1] <- sort(unique(joinSubject)[, 1])[x]
            result[row, 2] <- activity[y, 2]
            booleanX <- x == cleanedData$subject
            booleanY <- activity[y, 2] == cleanedData$activity
            result[row, 3:columnLength] <- colMeans(cleanedData[booleanX&booleanY, 3:columnLength])
            row <- row + 1
        }
    }
    head(result)
    write.table(result, "2nd_dataset.txt") # writing the 2nd data set
    message("exported the second dataset: 2nd_dataset.txt")
}