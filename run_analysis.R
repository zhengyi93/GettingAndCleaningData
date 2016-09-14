# run_analysis.R is saved within the "UCI HAR Dataset" unzipped folder
# Working directory set to ".../UCI HAR Dataset"

# Import libraries
library(dplyr)

# Extract raw data into R
labels <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt", stringsAsFactors=FALSE)

train.activity_id <- read.table("test/y_test.txt")
train.data <- read.table("test/X_test.txt")
train.subject_id <- read.table("test/subject_test.txt")

test.activity_id <- read.table("train/y_train.txt")
test.data <- read.table("train/X_train.txt")
test.subject_id <- read.table("train/subject_train.txt")

# [Task 3] Uses descriptive activity names to name the activities in the data set
train.activity <- sapply(train.activity_id, function(x) activity_labels[x,2])
test.activity <- sapply(test.activity_id, function(x) activity_labels[x,2])

# [Task 1] Merges the training and the test sets to create one data set

# 1.1: Bind subjectID, activityID and usage (Training/Testing) into data
train.data <- cbind(usage = "Training", train.subject_id, train.activity, train.data)
test.data <- cbind(usage = "Testing", test.subject_id, test.activity, test.data)

# 1.2: Merge training and testing data
mergedData <- rbind(test.data, train.data)

# [Task 4]: Appropriately labels the data set with descriptive variable names
# (Details of each label are noted in Code Book)
names(mergedData) <- c("Usage", "SubjectID", "Activity", levels(labels$V2))

# [Task 2] Extracts only the measurements on the mean and standard deviation for each measurement
extractList <- grep("mean+\\(+\\)|std+\\(+\\)|SubjectID|Activity", names(mergedData))
extractData <- mergedData[, extractList]

# [Task 5] From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable for each activity and each subject.
dataAverage <- extractData %>% group_by(SubjectID, Activity) %>% summarize_each(funs(mean))
names(dataAverage) <- sapply(names(dataAverage), function(x){
    if (x == "SubjectID" || x == "Activity") x
    else paste0("Average of [", x, "]")
    })

# Write solution to file
write.table(dataAverage, "dataAverage.txt", row.name=FALSE)

print(dataAverage)