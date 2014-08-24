To merge and clean data I did following steps...

STAGE #1
1. Reading the information about activities from activities_labels.txt. I'm using read.table funtion.
2. Reading info about types of variables collected during the experiments from features.txt. I'm using read.table funtion.
   From this table I will choose the std and mean variables.

STAGE#2 (PROCESSING TRAIN DATA) & STAGE#3 (PROCESSING TEST DATA)
For test and train data I do the following:
1. I read data from y_test.txt (y_train.txt), X_test.txt (X_train.txt) and subject_test.txt (subject_train.txt). Using read.table command for that. In this way I obtained 3 tables for test and 3 tables for train data.
2. I assigned to each activity mentioned in y_train.txt a human-readable description of an activity.

STAGE#4 (FINAL STAGE, COMBINING TRAIN & TEST DATA TOGETHER AND STORING THEM INTO A FILE)
Finally, I combine merged test and merged train data and store it in merged_data.txt file. What is stored in the file is the table with 10299 rows of data.
I checked that sum of rows from test and train data give the expected number of measurements, i.e. 10299 measurements.

DATA STRUCTURE
Each row consists of the "Trainee" data which is identifier of a person being source of data, activity a person was doing (i.e. Activity Code and Activity Description) and sensor data (only mean & standard deviation data). The exact structure of the data stored in merged_data.txt is as follows:
"Trainee" --> identifier of a person that was a source of data
"Activity Code" --> code of the activity that the person was doing (numeric one)
"Activity" --> description of the activity that a given person was doing (it's a decode of a numeric value which is mentioned above)
The rest of data are: mean and standard deviation data pulled out of files:
"tBodyAcc-mean()-X" "tBodyAcc-mean()-Y" "tBodyAcc-mean()-Z" "tBodyAcc-std()-X" "tBodyAcc-std()-Y" "tBodyAcc-std()-Z" "tGravityAcc-mean()-X" "tGravityAcc-mean()-Y" "tGravityAcc-mean()-Z" "tGravityAcc-std()-X" "tGravityAcc-std()-Y" "tGravityAcc-std()-Z" "tBodyAccJerk-mean()-X" "tBodyAccJerk-mean()-Y" "tBodyAccJerk-mean()-Z" "tBodyAccJerk-std()-X" "tBodyAccJerk-std()-Y" "tBodyAccJerk-std()-Z" "tBodyGyro-mean()-X" "tBodyGyro-mean()-Y" "tBodyGyro-mean()-Z" "tBodyGyro-std()-X" "tBodyGyro-std()-Y" "tBodyGyro-std()-Z" "tBodyGyroJerk-mean()-X" "tBodyGyroJerk-mean()-Y" "tBodyGyroJerk-mean()-Z" "tBodyGyroJerk-std()-X" "tBodyGyroJerk-std()-Y" "tBodyGyroJerk-std()-Z" "tBodyAccMag-mean()" "tBodyAccMag-std()" "tGravityAccMag-mean()" "tGravityAccMag-std()" "tBodyAccJerkMag-mean()" "tBodyAccJerkMag-std()" "tBodyGyroMag-mean()" "tBodyGyroMag-std()" "tBodyGyroJerkMag-mean()" "tBodyGyroJerkMag-std()" "fBodyAcc-mean()-X" "fBodyAcc-mean()-Y" "fBodyAcc-mean()-Z" "fBodyAcc-std()-X" "fBodyAcc-std()-Y" "fBodyAcc-std()-Z" "fBodyAcc-meanFreq()-X" "fBodyAcc-meanFreq()-Y" "fBodyAcc-meanFreq()-Z" "fBodyAccJerk-mean()-X" "fBodyAccJerk-mean()-Y" "fBodyAccJerk-mean()-Z" "fBodyAccJerk-std()-X" "fBodyAccJerk-std()-Y" "fBodyAccJerk-std()-Z" "fBodyAccJerk-meanFreq()-X" "fBodyAccJerk-meanFreq()-Y" "fBodyAccJerk-meanFreq()-Z" "fBodyGyro-mean()-X" "fBodyGyro-mean()-Y" "fBodyGyro-mean()-Z" "fBodyGyro-std()-X" "fBodyGyro-std()-Y" "fBodyGyro-std()-Z" "fBodyGyro-meanFreq()-X" "fBodyGyro-meanFreq()-Y" "fBodyGyro-meanFreq()-Z" "fBodyAccMag-mean()" "fBodyAccMag-std()" "fBodyAccMag-meanFreq()" "fBodyBodyAccJerkMag-mean()" "fBodyBodyAccJerkMag-std()" "fBodyBodyAccJerkMag-meanFreq()" "fBodyBodyGyroMag-mean()" "fBodyBodyGyroMag-std()" "fBodyBodyGyroMag-meanFreq()" "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" "fBodyBodyGyroJerkMag-meanFreq()"



