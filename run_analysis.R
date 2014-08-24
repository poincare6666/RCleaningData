source("run_analysis_util.R")

## MAIN LOOP OF THE PROGRAM
## MERGING DATA...
## 1. Pulling in data to process... this can take a while (e.g. 1 minute)...
print("Stage#1 - reading data from files... this can take a while (e.g. 1-2 minutes)")
reading.data()

print("CALCULATING MERGED DATA...")
## 2. processing training & test data
print("Stage#2 - processing train data...")
res_train <- merging_data(y_train, x_train, subject_train)
print ("Number of rows in train data:")
print(nrow(res_train))

print("Stage#2 - processing test data...")
res_test <- merging_data(y_test, x_test, subject_test)
print ("Number of rows in test data:")
print(nrow(res_test))

## 3. joining train and test data together
merged.tables <- rbind(res_train, res_test)
print ("Number of rows in combined data:")
print(nrow(merged.tables))

## 4. writing merged data to a file
data.file <- "merged_data.txt"
if (file.exists(data.file)) {
	file.remove(data.file)
}
write.table(merged.tables, data.file, append = FALSE, row.name = FALSE)
print("Merged data stored in: ")
print(data.file)

## CALCULATING AVERAGES...
print("CALCULATING AVERAGES...")
print("Stage#2 - calculating averages for train data...")
avg_train <- avg_data(y_train, subject_train,
	body_acc_x_train, body_acc_y_train, body_acc_z_train,
	body_gyro_x_train, body_gyro_y_train, body_gyro_z_train,
	total_acc_x_train, total_acc_y_train, total_acc_z_train)

print("Stage#2 - calculating averages for test data...")
avg_test <- avg_data(y_test, subject_test,
	body_acc_x_test, body_acc_y_test, body_acc_z_test,
	body_gyro_x_test, body_gyro_y_test, body_gyro_z_test,
	total_acc_x_test, total_acc_y_test, total_acc_z_test)

## 3. joining train and test data together
merged.avg.tables <- rbind(avg_train, avg_test)
print ("Number of rows in combined data:")
print(nrow(merged.avg.tables))

## writing merged data to a file
data.file <- "avg_data.txt"
if (file.exists(data.file)) {
	file.remove(data.file)
}
write.table(merged.avg.tables, data.file, append = FALSE, row.name = FALSE)
print("Average data stored in: ")
print(data.file)
