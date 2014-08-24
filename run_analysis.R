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
y_train <- read.table(file_train_y_train,encoding="UTF-8")
x_train <- read.table(file_train_x_train,encoding="UTF-8")
subject_train <- read.table(file_train_subject_train,encoding="UTF-8")

## reading test data
file_test_y_test <- paste(dirName_test, "y_test.txt", sep = "") 
file_test_x_test <- paste(dirName_test, "X_test.txt", sep = "")
file_test_subject_test <- paste(dirName_test, "subject_test.txt", sep = "")
y_test <- read.table(file_test_y_test,encoding="UTF-8")
x_test <- read.table(file_test_x_test,encoding="UTF-8")
subject_test <- read.table(file_test_subject_test,encoding="UTF-8")

## this function is used to merge data
process <- function(y, x, subject) {
	res1 <<- merge(activityLabels, y)
	sel1 <<- grep("std|mean", features$V2)
	x_sellected <- x[, sel1]
	cbind(res1, x_sellected)
}

## final state of the program
## processing training & test data
res_train <- process(y_train, x_train, subject_train)
res_test <- process(y_test, x_test, subject_test)

## joining train and test data together
res_total <- rbind(res_train, res_test)

## writing merged data to a file
write.table(res_total, "merged_data.txt", append = FALSE)
