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
    total
    
##    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    ## Remove all columns excluding MEAN & STD related ones

##    3. Uses descriptive activity names to name the activities in the data set
    ## Name Rows / Activities

##    4. Appropriately labels the data set with descriptive variable names.
    ## Name columns

##    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and $
    ## Create new data structure

    ## Calculate averages for subject + activity pairs

    ## Write result to txt file
    
}
