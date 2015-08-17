# CodeBook describing data modifications & files

## run.analysis.R does the following steps to generate analysed data file

## Step 1: Create train data frame
### Create data frame by reading train/X_train.txt
### Add subject data (train/subject_train.txt) into created data frame as first column
### Add activity data (train/y_train.txt) into created data frame as first column
### Data frame format after previous steps: col_1 = Activity, col_2 = Subject, col_3-563 = Data

## Step 2: Create test data frame
### Create data frame by reading test/X_test.txt
### Add subject data (test/subject_test.txt) into created data frame as first column
### Add activity data (test/y_train.txt) into created data frame as first column
### Data frame format after previous steps: col_1 = Activity, col_2 = Subject, col_3-563 = Data

## Step 3: Create total dataframe by combining test & train dataframes

## Step 4: TODO
