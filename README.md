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

Run source("run_analysis.R"), which will generate a new file MeanData.txt in the "UCI HAR Dataset" folder.

##Explanation
My R script run_analysis.R carries out the following steps:

1.  Change the working directory to that of the unzipped data(sorry, you'll have to change it back later!)
2.  Reads the data from the tables 
3.  Write the column names to the tables from the Features table.  I've also added the names Subject, ActivityIndex and ActivityLable for clarity.
4.  Merge the Subject data with the Test and Train data
5.  Merge the Test and Train data into a table called zAll and add in the description of the activities studied
6.  Create a data frame for all data with "mean" in the column heading
7.  Then remove all data with "meanFreq" as this is not a mean reading
8.  Create a data frame with for all data with "std" in the column heading
9.  Merge the Subject, activity, mean and standard deviation data into one data frame
10.  Melt the readings from the CleanData columns into a single column, grouping by Subject and ActivityLabel
11.  Calculate the mean for each of the variables
12.  Output the result to a txt file
