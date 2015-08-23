## CodeBook describing data modifications & files

 run.analysis.R does the following steps to generate analysed data file

### Step 1: Create train data frame
* Create data frame by reading train/X_train.txt
* Add subject data (train/subject_train.txt) into created data frame as first column
* Add activity data (train/y_train.txt) into created data frame as first column
* Data frame format after previous steps: col_1 = Activity, col_2 = Subject, col_3-563 = Data

### Step 2: Create test data frame
* Create data frame by reading test/X_test.txt
* Add subject data (test/subject_test.txt) into created data frame as first column
* Add activity data (test/y_train.txt) into created data frame as first column
* Data frame format after previous steps: col_1 = Activity, col_2 = Subject, col_3-563 = Data


### Step 3: Create total dataframe by combining test & train dataframes
* Add test rows into end of train rows

### Step 4: Select columns related to mean and standard deviation. Following 66 columns were selected from the orginal dataset:
* 1 tBodyAcc-mean()-X
* 2 tBodyAcc-mean()-Y
* 3 tBodyAcc-mean()-Z
* 4 tBodyAcc-std()-X
* 5 tBodyAcc-std()-Y
* 6 tBodyAcc-std()-Z
* 41 tGravityAcc-mean()-X
* 42 tGravityAcc-mean()-Y
* 43 tGravityAcc-mean()-Z
* 44 tGravityAcc-std()-X
* 45 tGravityAcc-std()-Y
* 46 tGravityAcc-std()-Z
* 81 tBodyAccJerk-mean()-X
* 82 tBodyAccJerk-mean()-Y
* 83 tBodyAccJerk-mean()-Z
* 84 tBodyAccJerk-std()-X
* 85 tBodyAccJerk-std()-Y
* 86 tBodyAccJerk-std()-Z
* 121 tBodyGyro-mean()-X
* 122 tBodyGyro-mean()-Y
* 123 tBodyGyro-mean()-Z
* 124 tBodyGyro-std()-X
* 125 tBodyGyro-std()-Y
* 126 tBodyGyro-std()-Z
* 161 tBodyGyroJerk-mean()-X
* 162 tBodyGyroJerk-mean()-Y
* 163 tBodyGyroJerk-mean()-Z
* 164 tBodyGyroJerk-std()-X
* 165 tBodyGyroJerk-std()-Y
* 166 tBodyGyroJerk-std()-Z
* 201 tBodyAccMag-mean()
* 202 tBodyAccMag-std()
* 214 tGravityAccMag-mean()
* 215 tGravityAccMag-std()
* 227 tBodyAccJerkMag-mean()
* 228 tBodyAccJerkMag-std()
* 240 tBodyGyroMag-mean()
* 241 tBodyGyroMag-std()
* 253 tBodyGyroJerkMag-mean()
* 254 tBodyGyroJerkMag-std()
* 266 fBodyAcc-mean()-X
* 267 fBodyAcc-mean()-Y
* 268 fBodyAcc-mean()-Z
* 269 fBodyAcc-std()-X
* 270 fBodyAcc-std()-Y
* 271 fBodyAcc-std()-Z
* 345 fBodyAccJerk-mean()-X
* 346 fBodyAccJerk-mean()-Y
* 347 fBodyAccJerk-mean()-Z
* 348 fBodyAccJerk-std()-X
* 349 fBodyAccJerk-std()-Y
* 350 fBodyAccJerk-std()-Z
* 424 fBodyGyro-mean()-X
* 425 fBodyGyro-mean()-Y
* 426 fBodyGyro-mean()-Z
* 427 fBodyGyro-std()-X
* 428 fBodyGyro-std()-Y
* 429 fBodyGyro-std()-Z
* 503 fBodyAccMag-mean()
* 504 fBodyAccMag-std()
* 516 fBodyBodyAccJerkMag-mean()
* 517 fBodyBodyAccJerkMag-std()
* 529 fBodyBodyGyroMag-mean()
* 530 fBodyBodyGyroMag-std()
* 542 fBodyBodyGyroJerkMag-mean()
* 543 fBodyBodyGyroJerkMag-std()

### Step 5: Convert activity numbers to readable form in column 1
* Conversion used:
* 1 == WALKING
* 2 == WALKING_UPSTAIRS
* 3 == WALKING_DOWNSTAIRS
* 4 == SITTING
* 5 == STANDING
* 6 == LAYING

### Step 6: Add readable column names into data frame using data from features.txt file
* Column names selected in Step 4 added into new dataset as headers. New dataset has following columns:
* 1 Activity
* 2 Subject
* 3 tBodyAcc-mean()-X
* 4 tBodyAcc-mean()-Y
* 5 tBodyAcc-mean()-Z
* 6 tBodyAcc-std()-X
* 7 tBodyAcc-std()-Y
* 8 tBodyAcc-std()-Z
* 9 tGravityAcc-mean()-X
* 10 tGravityAcc-mean()-Y
* 11 tGravityAcc-mean()-Z
* 12 tGravityAcc-std()-X
* 13 tGravityAcc-std()-Y
* 14 tGravityAcc-std()-Z
* 15 tBodyAccJerk-mean()-X
* 16 tBodyAccJerk-mean()-Y
* 17 tBodyAccJerk-mean()-Z
* 18 tBodyAccJerk-std()-X
* 19 tBodyAccJerk-std()-Y
* 20 tBodyAccJerk-std()-Z
* 21 tBodyGyro-mean()-X
* 22 tBodyGyro-mean()-Y
* 23 tBodyGyro-mean()-Z
* 24 tBodyGyro-std()-X
* 25 tBodyGyro-std()-Y
* 26 tBodyGyro-std()-Z
* 27 tBodyGyroJerk-mean()-X
* 28 tBodyGyroJerk-mean()-Y
* 29 tBodyGyroJerk-mean()-Z
* 30 tBodyGyroJerk-std()-X
* 31 tBodyGyroJerk-std()-Y
* 32 tBodyGyroJerk-std()-Z
* 33 tBodyAccMag-mean()
* 34 tBodyAccMag-std()
* 35 tGravityAccMag-mean()
* 36 tGravityAccMag-std()
* 37 tBodyAccJerkMag-mean()
* 38 tBodyAccJerkMag-std()
* 39 tBodyGyroMag-mean()
* 40 tBodyGyroMag-std()
* 41 tBodyGyroJerkMag-mean()
* 42 tBodyGyroJerkMag-std()
* 43 fBodyAcc-mean()-X
* 44 fBodyAcc-mean()-Y
* 45 fBodyAcc-mean()-Z
* 46 fBodyAcc-std()-X
* 47 fBodyAcc-std()-Y
* 48 fBodyAcc-std()-Z
* 49 fBodyAccJerk-mean()-X
* 50 fBodyAccJerk-mean()-Y
* 51 fBodyAccJerk-mean()-Z
* 52 fBodyAccJerk-std()-X
* 53 fBodyAccJerk-std()-Y
* 54 fBodyAccJerk-std()-Z
* 55 fBodyGyro-mean()-X
* 56 fBodyGyro-mean()-Y
* 57 fBodyGyro-mean()-Z
* 58 fBodyGyro-std()-X
* 59 fBodyGyro-std()-Y
* 60 fBodyGyro-std()-Z
* 61 fBodyAccMag-mean()
* 62 fBodyAccMag-std()
* 63 fBodyBodyAccJerkMag-mean()
* 64 fBodyBodyAccJerkMag-std()
* 65 fBodyBodyGyroMag-mean()
* 66 fBodyBodyGyroMag-std()
* 67 fBodyBodyGyroJerkMag-mean()
* 68 fBodyBodyGyroJerkMag-std()

### Step 7: TODO
