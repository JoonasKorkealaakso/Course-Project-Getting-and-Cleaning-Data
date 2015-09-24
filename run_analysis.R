## setwd("~/") - set working directory to folder with the 'UCI HAR Dataset'

## The reshape2 package is needed to run the melt and dcast commands
library (reshape2) 

## 1.Merges the training and the test sets to create one data set

## Read the training data, labels & subjects into R
trainingdata <- read.table("~/UCI HAR Dataset/train/X_train.txt")
traininglabels <- read.table("~/UCI HAR Dataset/train/y_train.txt")
trainingsubject <- read.table("~/UCI HAR Dataset/train/subject_train.txt")

## Read the testing data, labels & subject into R
testdata <- read.table("~/UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("~/UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("~/UCI HAR Dataset/test/subject_test.txt")

## Read the feature and the acitivity data into R
featuredata <- read.table("~/UCI HAR Dataset/features.txt")
activitydata <- read.table("~/UCI HAR Dataset/activity_labels.txt")

## 2.Extracts only the measurements on the mean and standard deviation for each
## measurement.

## Select mean and standard deviation methods using grep
selectedfeatures <- grep("mean\\(|std\\(", featuredata$V2)

## 3.Uses descriptive activity names to name the activities in the data set

## Change activity name letters into lower case and remove underscores ('_')
activitydata$V2 <- tolower(gsub("_","",activitydata$V2))

## Merge the test and training activities with the descriptive activity labels
mergelabels <- rbind(traininglabels, testlabels)
mergelabels[, 1] <- activitydata[mergelabels[, 1], 2]
names(mergelabels) <- "Activity"

## 4.Labels the data set with descriptive variable names

## Merges the test and training data into together and subsets it with only the
## extracted mean and standard deviation measurements
## Labels the variables using the feature names
mergedata <- rbind(trainingdata, testdata)
mergedata <- mergedata[, selectedfeatures]
names(mergedata) <- featuredata[selectedfeatures, "V2"]

## Change abbreviations in variables into their full form and capitalize the
## starting letters, remove the hyphens and brackets from the variable names
names(mergedata) <- gsub("Acc","Acceleration", names(mergedata))
names(mergedata) <- gsub("Mag","Magnitude", names(mergedata))
names(mergedata) <- gsub("Freq","Frequency", names(mergedata))
names(mergedata) <- gsub("\\-","", names(mergedata))
names(mergedata) <- gsub("std","StandardDeviation",
                          names(mergedata))
names(mergedata) <- gsub("mean","Mean",
                          names(mergedata))
names(mergedata) <- gsub("\\(|\\)","", names(mergedata))

## Join training and test subject data sets
## Rename the column name of the combined subject set as "Subject"
mergesubject <- rbind(trainingsubject, testsubject)
names(mergesubject) <- "Subject"

## Bind all three merged data sets into a single tidy data set
tidydata <- cbind(mergesubject,mergelabels,mergedata)

## 5.From the data set in step 4, creates a second, independent tidy data 
## set with the average of each variable for each activity and each subject

## Using 'melt' and 'dcast' from the"reshape2" package, create a tidy data set
## with mean values of each variable for all subject and activity combinations
meltvariable <- melt(tidydata, id.vars = c("Subject","Activity"))
tidymeandata <- dcast(meltvariable, Subject+Activity ~ variable, mean)

write.table(tidymeandata, "tidymeandata.txt", row.name = FALSE)