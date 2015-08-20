## TODO
##
##

analyse <- function() {
 
##    1. Merges the training and the test sets to create one data set.
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
    
##    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    ## Create new data frame with following columns 
    ## 1 activity
    ## 2 subject
    ## all columns related to mean or std:
    ## 3-8 tBodyAcc
    ## 43-48 tGravityAcc
    ## 83-88 tBodyAccJerk
    ## 123-128 tBodyGyro
    ## 163-168 tBodyGyroJerk
    ## 203-204 tBodyAccMag
    ## 216-217 tGravityAccMag
    ## 229-230 tBodyAccJerkMag
    ## 242-243 tBodyGyroMag
    ## 255-256 tBodyGyroJerkMag
    ## 268-273 fBodyAcc
    ## 347-352 fBodyAccJerk
    ## 426-431 fBodyGyro
    ## 505-506 fBodyAccMag
    ## 518-519 fBodyBodyAccJerkMag
    ## 531-532 fBodyBodyGyroMAg
    ## 544-545 fBodyBodyGyroJerkMag
        ## -> 66 mean&std columns selected

    filtered <- total[, c(1,2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]

##    3. Uses descriptive activity names to name the activities in the data set
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
    filtered
##    4. Appropriately labels the data set with descriptive variable names.
    ## Name columns

##    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and $
    ## Create new data structure

    ## Calculate averages for subject + activity pairs

    ## Write result to txt file
    
}
