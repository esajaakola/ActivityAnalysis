## Analyse function does the following steps on data orginally fetched from Samsung Smartphones:
##
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of 
##      each variable for each activity and subject.

analyse <- function() {
 
    ## Step 1.
    ## Read train data
    train_data <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
    train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
    train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
    ## Add subjects to dataset
    train <- cbind(train_subjects, train_data)
    ## Add activities to dataset
    train <- cbind(train_activities, train)
      
    ## Read test data
    test_data <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
    test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
    test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
    # Add subject column to dataset
    test <- cbind(test_subjects, test_data)
    ## Add activity column to dataset
    test <- cbind(test_activities, test)
    
    ## Combine datasets
    total <- rbind(train, test)
    
    ## Step 2.
    ## Create new data frame with select columns (see CodeBook.md)
    filtered <- total[, c(1,2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]

    ## Step 3.
    ## Convert activity names to readable form
    for(i in 1:nrow(filtered)) {
        x = as.integer(filtered[i,1])
        if(x == 1) filtered[i,1] <- "WALKING"
        if(x == 2) filtered[i,1] <- "WALKING_UPSTAIRS"
        if(x == 3) filtered[i,1] <- "WALKING_DOWNSTAIRS"
        if(x == 4) filtered[i,1] <- "SITTING"
        if(x == 5) filtered[i,1] <- "STANDING"
        if(x == 6) filtered[i,1] <- "LAYING"
    }

    ## Step 4.
    ## Add readable column names into data frame using data from features.txt file
    colnames(filtered) <- c("Activity", ## 1
                      "Subject", ## 2
                    "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", ## 3-5
                    "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z", ## 6-8
                    "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", ## 9-11
                    "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z", ## 12-14                      
                    "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", ## 15-17
                    "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z", ## 18-20
                    "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", ## 21-23
                    "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z", ## 24-26
                    "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", ## 27-29
                    "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z", ## 30-32
                    "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()", ## 33-36
                    "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()", ## 37-40
                    "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()", ## 41-42
                    "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", ## 43-45
                    "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z", ## 46-48
                    "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", ## 49-51
                    "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z", ## 52-54
                    "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", ## 55-57
                    "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z", ## 58-60
                    "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()", ## 61-64
                    "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()") ## 65-68

    ## Step 5.
    ## Create final dataframe
    final <- melt(filtered, id=c("Activity", "Subject"),measure.vars=c("tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", ## 3-5
                    "tBodyAcc-std()-X", "tBodyAcc-std()-Y", "tBodyAcc-std()-Z",
                  "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z",
                  "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z",
                  "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z",
                  "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z",
                  "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z",
                  "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z",
                  "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z",
                  "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z",
                  "tBodyAccMag-mean()", "tBodyAccMag-std()", "tGravityAccMag-mean()", "tGravityAccMag-std()",
                  "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()", "tBodyGyroMag-std()",
                  "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()",
                  "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z",
                  "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z",
                  "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z",
                  "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z",
                  "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z",
                  "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z",
                  "fBodyAccMag-mean()", "fBodyAccMag-std()", "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()",
                  "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()", "fBodyBodyGyroJerkMag-std()"))
    
    ## Calculate averages for subject + activity pairs
    averages <- dcast(final, Activity + Subject ~ variable,mean)

    ## Write result to txt file
    write.table(averages, "data.txt", row.names=FALSE)
}
