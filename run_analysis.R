## This is my R script called run_analysis.R that carries out the following steps in order to produce the output for step 5:
## 1.  Merges the training and the test sets to create one data set.
## 2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.  Uses descriptive activity names to name the activities in the data set
## 4.  Appropriately labels the data set with descriptive variable names. 
## 5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##  I ran this in rStudio. I've included the lines 12 to 18 as text as the question says that the data should already be in your working directory.

## Install package to download the file and unzip it

##if (!require("downloader")) {
##    install.packages("downloader")
##}
##library(downloader)

##download(fileUrl, dest="dataset.zip", mode="wb") 
##unzip ("dataset.zip")

## Change the working directory to that of the unzipped data and read the tables.

setwd("UCI HAR Dataset")
xTest <- read.table("./test/x_test.txt")
yTest <- read.table("./test/y_test.txt")
subjectTest <- read.table("./test/subject_test.txt")

xTrain <- read.table("./train/x_train.txt")
yTrain <- read.table("./train/y_train.txt")
subjectTrain <- read.table("./train/subject_train.txt")

Features <- read.table("./Features.txt")
ActivityLabels <- read.table("./activity_labels.txt")

## Write the column names to the correct tables
colnames(xTest) <- features[,2]
colnames(xTrain) <- features[,2]
colnames(yTest) <- "ActivityIndex"
colnames(yTrain) <- "ActivityIndex"
colnames(subjectTest) <- "Subject"
colnames(subjectTrain) <- "Subject"
colnames(ActivityLabels)<- c("ActivityIndex","ActivityLabel")

## Merge the Subject data with the Test and Train data
zTest <- cbind(subjectTest,yTest,xTest)
zTrain <- cbind(subjectTrain,yTrain,xTrain)

## Merge the Test and Train data into a table called zAll and add in the description of the activities studied
zAll <- rbind(zTest,zTrain)
zAll <- merge(zAll,ActivityLabels,by = "ActivityIndex")

## Create a data frame for all data with "mean" in the column heading, then remove all data with "meanFreq" as this is not a mean reading
zMean <- zAll[, grepl("mean", names(zAll))]
zMean <- zMean[, ! grepl("meanFreq", names(zMean))]

## Create a data frame with for all data with "std" in the column heading and merge the Subject, activity, mean and standard deviation data into one data frame
zStd <- zAll[, grepl("std", names(zAll))]
CleanData <- cbind(zAll["Subject"], zAll["ActivityIndex"], zAll["ActivityLabel"], zMean, zStd)

## Melt the readings from the CleanData columns into a single column, grouping by Subject and ActivityLabel
library(reshape2)
CleanDataMelt <- melt(CleanData,id=c("Subject","ActivityLabel"), measure.vars = c( colnames(CleanData[,4:69])))

## Calculate the mean for each of the variables
library(plyr)
MeanData <- ddply(CleanDataMelt, c("Subject", "ActivityLabel", "variable"), summarize, mean = mean(value))

##Output the result to a txt file.
write.table(MeanData, file = "MeanData.csv", sep = ",", row.name=FALSE, qmethod = "double")
