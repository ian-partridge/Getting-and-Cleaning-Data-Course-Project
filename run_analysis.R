## Script for the coursera 'getting and cleaning data'  course by John 
## Hopkins University
##
## Author: Ian Partridge
## Date: 24/06/2022
## see: https://www.coursera.org/learn/data-cleaning/peer/FIZtT/
## getting-and-cleaning-data-course-project,  for further details of
## project scope.


# 1 load required libraries for script
library(data.table)
library(stringr)

# 2 Merges the train data and the test data to create one data set.
# 2.1 read the data sets and variable information into R data.tables
#activityLabels <- fread("UCI HAR Dataset/activity_labels.txt")
features <- fread("UCI HAR Dataset/features.txt")
xtest <- fread("UCI HAR Dataset/test/x_test.txt")
xtrain <- fread("UCI HAR Dataset/train/x_train.txt")
ytest <- fread("UCI HAR Dataset/test/y_test.txt")
ytrain <- fread("UCI HAR Dataset/train/y_train.txt")
subjectTest <- fread("UCI HAR Dataset/test/subject_test.txt")
subjectTrain <- fread("UCI HAR Dataset/train/subject_train.txt")
# 2.2 add column names to test and train data.tables
colnames(xtest) <- features$V2
colnames(xtrain) <- features$V2
# 2.3 add activity and volunteer ID columns to the test and train data.tables
xtest <- cbind("Activity" = ytest$V1, xtest)
xtrain <- cbind("Activity" = ytrain$V1, xtrain)
xtest <- cbind("Volunteer.ID" = subjectTest$V1, xtest)
xtrain <- cbind("Volunteer.ID" = subjectTrain$V1, xtrain)
# 2.4 merge test and train data.tables into one data.table
completeDT <- rbind(xtest, xtrain)

# 3 Extract only the measurements on the mean and standard 
#   deviation for each measurement and put into new database
# 3.1 create a list of column names which include the 
#   strings 'mean()' and 'std()' and the "Volunteer.ID" and "Activity" columns
meanStdColNames <- c("Volunteer.ID","Activity", 
                     grep(pattern = "mean\\(\\)|std\\(\\)", x = features$V2, value = TRUE))
# 3.2  create a data.table from completeDT data.table containing just 
#      the meanStdColNames columns  
meanStdDT <- completeDT[, meanStdColNames, with=FALSE]

# 4 change the Activity column from numeric codes to relevant strings
meanStdDT$Activity <- activityLabels$V2[meanStdDT$Activity]

# 5 Make the meanStdDT data.table column names 
#   have descriptive variable names
cNames <- colnames(meanStdDT)
#   create a list of descriptive variable names which are '.' separated
expName <- lapply(cNames, function(x) {
  x<- str_replace(x,"^t", "time.")
  x<- str_replace(x,"^f", "frequency.")
  x<- str_replace(x,"Acc", ".accelerometer.")
  x<- str_replace(x,"Gyro", ".gyroscope.")
  x<- str_replace_all(x,"-", "\\.")
  x<- str_replace(x,"\\.\\.", ".")
  x<- str_replace(x,"\\(\\)", "")
  x<- tolower(x)
})
expName <- unlist(expName) # make a vector from list (same class as cNames)
setnames(meanStdDT, cNames, expName) # update meanStdDT column names

# 5 From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
tidyData <- meanStdDT[, lapply(.SD, mean), by=.(volunteer.id, activity)]

# 6 Export the tidyData data set as a txt file created with write.table() 
# using row.name=FALSE
write.table(tidyData,"tidy_data.txt", row.name=FALSE)