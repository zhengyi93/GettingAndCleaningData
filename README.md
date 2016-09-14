# Getting And Cleaning Data
Getting and Cleaning Data Course Project - Coursera

###Introduction
Getting and cleaning data collected from the accelerometers from the Samsung Galaxy S smartphone.
Data Details: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones   
Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Basic Summary of Data
* Sample Size of 30 people data
* Data is divided into Training Data and Testing Data
 * Training Data is used for supervised learning algorithms
 * Testing Data is used to determine how the classification/regression model performs
* SubjectID is the ID associated  
 * stored in **test/subject_test.txt** and **train/subject_train.txt** respectively
* ActivityID  and denotes the activity the subject is undergoing during data observation
 * represents the ID corresponding to the map given in **activity_labels.txt**
 * stored in **test/y_test.txt** and **train/y_test.txt** respectively
* Data column labels are located in **features.txt**
 * More information on each data located in **features_info.txt**
* Actual collection of (unlabelled) data is located in **test/X_test.txt** & **train/X_train.txt** respectively
 
###Aims and Procedures
1. Merges the training and the test sets to create one data set.
 * Bind subjectID, activityID and usage (Training/Testing) into data using cbind
 * Merge training and testing data using rbind
2. Extracts only the measurements on the mean and standard deviation for each measurement.
 * Select columns using regex on column names
3. Uses descriptive activity names to name the activities in the data set
 * Map ActivityID to Activity using **activity_labels.txt**
4. Appropriately labels the data set with descriptive variable names.
 * Assign the data labels in **features.txt** into Data
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 * Data is grouped by the *dplyr* package *group_by* function and subsequently summarized via *summarized_each* by their mean 
 
####Interpretation of Task 5 
This project makes the following definitions:<br>
 * **each variable** to be *independent measurements of activity/subject actions*. [1]
 * Each coordinate takes *independent measurements* 
 
We use the 1st clause of Codd's 3rd normal form: <br>
 1. Each variable forms a column. [2]
 
The view adopted is that a *wide dataset* would be more appropriate given the above premises.

######References<br> [1] Hood, D. (2015) Getting and cleaning the assignment. Available at: https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/ (Accessed: 14 September 2016). <br> [2] Wickham, H. (2014) ‘Tidy data’, Journal of Statistical Software, 59(10). doi: 10.18637/jss.v059.i10.
