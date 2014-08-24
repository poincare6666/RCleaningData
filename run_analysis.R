sys.frame(0)$ofile

## this function reads necessary data from the files
reading.data <- function() {
	## names of directories
	dirName_1 <- "UCI HAR Dataset\\"
	dirName_train <- "UCI HAR Dataset\\train\\"
	dirName_test <- "UCI HAR Dataset\\test\\"

	## basic information - reading data from files about features and activities 
	fileFeaturesInfo <- paste(dirName_1,"features_info.txt", sep = "")
	fileFeatures <- paste(dirName_1, "features.txt", sep = "")
	fileActivityLabels <- paste(dirName_1, "activity_labels.txt", sep = "")
	features <- read.table(fileFeatures,encoding="UTF-8")
	activityLabels <- read.table(fileActivityLabels,encoding="UTF-8")

	## reading train data
	file_train_y_train <- paste(dirName_train, "y_train.txt", sep = "") 
	file_train_x_train <- paste(dirName_train, "X_train.txt", sep = "")
	file_train_subject_train <- paste(dirName_train, "subject_train.txt", sep = "")
	y_train <<- read.table(file_train_y_train,encoding="UTF-8")
	x_train <<- read.table(file_train_x_train,encoding="UTF-8")
	subject_train <<- read.table(file_train_subject_train,encoding="UTF-8")

	## reading test data
	file_test_y_test <- paste(dirName_test, "y_test.txt", sep = "") 
	file_test_x_test <- paste(dirName_test, "X_test.txt", sep = "")
	file_test_subject_test <- paste(dirName_test, "subject_test.txt", sep = "")
	y_test <<- read.table(file_test_y_test,encoding="UTF-8")
	x_test <<- read.table(file_test_x_test,encoding="UTF-8")
	subject_test <<- read.table(file_test_subject_test,encoding="UTF-8")
}

## this function is used to merge data
process <- function(y, x, subject) {
	y_activities <<- merge(activityLabels, y)
	colnames(y_activities) <<- c("Activity Code", "Activity")
	subject.priv <<- subject
	colnames(subject.priv) <<- c("Trainee")
	trainee_activities <<- cbind(subject.priv, y_activities)
	##colnames(trainee_activities) <<- c("Trainee", "Activity Code", "Activity")
	columnSelection <<- grep("std|mean", features$V2)
	x_sellected <<- x[, columnSelection]
	colnames(x_sellected) <<- features[columnSelection, ]$V2	
	cbind(trainee_activities, x_sellected)
}

## MAIN LOOP OF THE PROGRAM

## 1. Pulling in data to process
print("Stage#1 - reading data from files...")
reading.data()

## 2. processing training & test data
print("Stage#2 - processing train...")
res_train <- process(y_train, x_train, subject_train)
print ("Number of rows in train data:")
print(nrow(res_train))

print("Stage#2 - processing test...")
res_test <- process(y_test, x_test, subject_test)
print ("Number of rows in test data:")
print(nrow(res_test))

## 4. joining train and test data together
merged.tables <- rbind(res_train, res_test)
print ("Number of rows in combined data:")
print(nrow(merged.tables))
## 5. writing merged data to a file
data.file <- "merged_data.txt"
if (file.exists(data.file)) {
	file.remove(data.file)
}
write.table(merged.tables, data.file, append = FALSE, row.name = FALSE)