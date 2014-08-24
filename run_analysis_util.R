## this function reads necessary data from the files
reading.data <- function() {
	## names of directories
	dirName_1 <- "UCI HAR Dataset\\"
	dirName_train <- "UCI HAR Dataset\\train\\"
	dirName_test <- "UCI HAR Dataset\\test\\"
	dirName_train_data <- "UCI HAR Dataset\\train\\Inertial Signals\\"
	dirName_test_data <- "UCI HAR Dataset\\test\\Inertial Signals\\"	

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

	file_body_acc_x_train <- paste(dirName_train_data, "body_acc_x_train.txt", sep = "") 
	file_body_acc_y_train <- paste(dirName_train_data, "body_acc_y_train.txt", sep = "") 
	file_body_acc_z_train <- paste(dirName_train_data, "body_acc_z_train.txt", sep = "") 
	file_body_gyro_x_train <- paste(dirName_train_data, "body_gyro_x_train.txt", sep = "")
	file_body_gyro_y_train <- paste(dirName_train_data, "body_gyro_y_train.txt", sep = "") 
	file_body_gyro_z_train <- paste(dirName_train_data, "body_gyro_z_train.txt", sep = "") 
	file_total_acc_x_train <- paste(dirName_train_data, "total_acc_x_train.txt", sep = "") 
	file_total_acc_y_train <- paste(dirName_train_data, "total_acc_y_train.txt", sep = "") 
	file_total_acc_z_train <- paste(dirName_train_data, "total_acc_z_train.txt", sep = "") 
	body_acc_x_train <<- read.table(file_body_acc_x_train)
	body_acc_y_train <<- read.table(file_body_acc_y_train)
	body_acc_z_train <<- read.table(file_body_acc_z_train)
	body_gyro_x_train <<- read.table(file_body_gyro_x_train)
	body_gyro_y_train <<- read.table(file_body_gyro_y_train)
	body_gyro_z_train <<- read.table(file_body_gyro_z_train)
	total_acc_x_train <<- read.table(file_total_acc_x_train)
	total_acc_y_train <<- read.table(file_total_acc_y_train)
	total_acc_z_train <<- read.table(file_total_acc_z_train)

	file_body_acc_x_test <- paste(dirName_test_data, "body_acc_x_test.txt", sep = "") 
	file_body_acc_y_test <- paste(dirName_test_data, "body_acc_y_test.txt", sep = "") 
	file_body_acc_z_test <- paste(dirName_test_data, "body_acc_z_test.txt", sep = "") 
	file_body_gyro_x_test <- paste(dirName_test_data, "body_gyro_x_test.txt", sep = "") 
	file_body_gyro_y_test <- paste(dirName_test_data, "body_gyro_y_test.txt", sep = "") 
	file_body_gyro_z_test <- paste(dirName_test_data, "body_gyro_z_test.txt", sep = "") 
	file_total_acc_x_test <- paste(dirName_test_data, "total_acc_x_test.txt", sep = "") 
	file_total_acc_y_test <- paste(dirName_test_data, "total_acc_y_test.txt", sep = "") 
	file_total_acc_z_test <- paste(dirName_test_data, "total_acc_z_test.txt", sep = "") 
	body_acc_x_test <<- read.table(file_body_acc_x_test)
	body_acc_y_test <<- read.table(file_body_acc_y_test)
	body_acc_z_test <<- read.table(file_body_acc_z_test)
	body_gyro_x_test <<- read.table(file_body_gyro_x_test)
	body_gyro_y_test <<- read.table(file_body_gyro_y_test)
	body_gyro_z_test <<- read.table(file_body_gyro_z_test)
	total_acc_x_test <<- read.table(file_total_acc_x_test)
	total_acc_y_test <<- read.table(file_total_acc_y_test)
	total_acc_z_test <<- read.table(file_total_acc_z_test)
}

## this function is used to merge data
merging_data <- function(y, x, subject) {
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

## this function is used to average data
avg_data <- function(y, subject,
	body_acc_x, body_acc_y, body_acc_z,
	body_gyro_x, body_gyro_y, body_gyro_z,
	body_total_x, body_total_y, body_total_z) {
	
	y_activities <- merge(activityLabels, y)
	colnames(y_activities) <- c("Activity Code", "Activity")
	subject.priv <- subject
	colnames(subject.priv) <- c("Trainee")
	trainee_activities <- cbind(subject.priv, y_activities)

	avg_acc_x_r <- rowMeans(body_acc_x)
	avg_acc_x_c <- matrix(avg_acc_x_r, nrow = length(avg_acc_x_r))
	colnames(avg_acc_x_c) <- c("avg. body acc x")
	result <- cbind(trainee_activities, avg_acc_x_c)

	avg_acc_y_r <- rowMeans(body_acc_y)
	avg_acc_y_c <- matrix(avg_acc_y_r, nrow = length(avg_acc_y_r))
	colnames(avg_acc_y_c) <- c("avg. body acc y")
	result <- cbind(result, avg_acc_y_c)

	avg_acc_z_r <- rowMeans(body_acc_z)
	avg_acc_z_c <- matrix(avg_acc_z_r, nrow = length(avg_acc_z_r))
	colnames(avg_acc_z_c) <- c("avg. body acc z")
	result <- cbind(result, avg_acc_z_c)

	avg_gyro_x_r <- rowMeans(body_gyro_x)
	avg_gyro_x_c <- matrix(avg_gyro_x_r, nrow = length(avg_gyro_x_r))
	colnames(avg_gyro_x_c) <- c("avg. body gyro x")
	result <- cbind(result, avg_gyro_x_c)

	avg_gyro_y_r <- rowMeans(body_gyro_y)
	avg_gyro_y_c <- matrix(avg_gyro_y_r, nrow = length(avg_gyro_y_r))
	colnames(avg_gyro_y_c) <- c("avg. body gyro y")
	result <- cbind(result, avg_gyro_y_c)

	avg_gyro_z_r <- rowMeans(body_gyro_z)
	avg_gyro_z_c <- matrix(avg_gyro_z_r, nrow = length(avg_gyro_z_r))
	colnames(avg_gyro_z_c) <- c("avg. body gyro z")
	result <- cbind(result, avg_gyro_z_c)

	avg_total_x_r <- rowMeans(body_total_x)
	avg_total_x_c <- matrix(avg_total_x_r, nrow = length(avg_total_x_r))
	colnames(avg_total_x_c) <- c("avg. total acc x")
	result <- cbind(result, avg_total_x_c)

	avg_total_y_r <- rowMeans(body_total_y)
	avg_total_y_c <- matrix(avg_total_y_r, nrow = length(avg_total_y_r))
	colnames(avg_total_y_c) <- c("avg. total acc y")
	result <- cbind(result, avg_total_y_c)

	avg_total_z_r <- rowMeans(body_total_z)
	avg_total_z_c <- matrix(avg_total_z_r, nrow = length(avg_total_z_r))
	colnames(avg_total_z_c) <- c("avg. total acc z")
	result <- cbind(result, avg_total_z_c)
}
