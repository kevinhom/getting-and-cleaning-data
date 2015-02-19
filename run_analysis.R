# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

library(dplyr)
library(tidyr)

# First we will read the test and train X data
# Then merge the two data sets together and combine with their labels
test.subject <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/test/subject_test.txt", colClasses = "numeric")
colnames(test.subject) <- c("Subject")
testX <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/test/X_test.txt", colClasses = "numeric")
testY <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/test/y_test.txt", colClasses = "numeric")
colnames(testY) <- c("Activity")

# We add the column names to the test data
features <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
features <- select(features, V2)
features <- t(features)
features <- make.names(features, unique = TRUE)
colnames(testX) <- features

# Goal #2 - Trim down to mean and std
testX <- select(testX, matches("(mean|std)"))
testX <- select(testX, -matches("(Freq|angle)"))

test.data <- cbind(test.subject, testY, testX)

rm("test.subject", "testX", "testY")

# We do the same with the train data
train.subject <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/train/subject_train.txt", colClasses = "numeric")
colnames(train.subject) <- c("Subject")
trainX <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/train/X_train.txt", colClasses = "numeric")
colnames(trainX) <- features
trainY <- read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/train/y_train.txt", colClasses = "numeric")
colnames(trainY) <- c("Activity")

trainX <- select(trainX, matches("(mean|std)"))
trainX <- select(trainX, -matches("(Freq|angle)"))

train.data <- cbind(train.subject, trainY, trainX)

rm("train.subject", "trainX", "trainY", "features")

# To complete goal #1 of this script, we then combine the two data frames of test and train data
subject.data <- rbind(test.data, train.data)

rm("test.data", "train.data")

# Goal #4 - Cleaning the variable names (manually) - This next line can be skipped if measurement_names.txt already exists
write.table(colnames(subject.data), "measurement_names.txt", row.names = FALSE)

# After some manual cleaning
measurement.names <- t(read.table("~/R Files/Getting and Cleaning Data Project/UCI HAR Dataset/measurement_names.txt", stringsAsFactors = FALSE))
colnames(subject.data) <- measurement.names

# Goal #3 - Activity labels
subject.data$Activity[subject.data$Activity == "1"] <- "WALKING"
subject.data$Activity[subject.data$Activity == "2"] <- "WALKING UPSTAIRS"
subject.data$Activity[subject.data$Activity == "3"] <- "WALKING DOWNSTAIRS"
subject.data$Activity[subject.data$Activity == "4"] <- "SITTING"
subject.data$Activity[subject.data$Activity == "5"] <- "STANDING"
subject.data$Activity[subject.data$Activity == "6"] <- "LAYING"

# Reorder the data for readability
# Not necessary, but we can print after this line if we wanted all of the data points
subject.data <- arrange(subject.data, Subject, Activity)

# Goal #5 - Creating a second, independent tidy data set with the average of each variable
# for each activity and subject
data.summary <- subject.data %>%
  group_by(Subject, Activity) %>%
  summarise_each(funs(mean))

write.table(data.summary, file = "tidyset.txt", row.names = FALSE)
