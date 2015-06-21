#Getting and Cleaning Data
##Course Project

The purpose of this project was to create one R script called run_analysis.R that:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##In order to run the run_analysis.R script

Download the data source and unzip into your working directory folder on your local drive. You should now have a "UCI HAR Dataset" folder in your working directory.
Put run_analysis.R in your working directory.
If not already available, install packages
  reshape2
  plyr

Run source("run_analysis.R"), then it will generate a new file MeanData.txt in the "UCI HAR Dataset" folder.

