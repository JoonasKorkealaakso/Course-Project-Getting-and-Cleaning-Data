# Getting and Cleaning Data -  Course Project
### Description and explanation of the run_analysis.R script
### By: Joonas Korkealaakso

This document describes how the run_analysis.R script works. In addition to this README file, this repository contains the R script and a CodeBook document describing data and variables that were used, as well as, all the transformations that were done on the original data set.

## Project data
The script uses the _Human Activity Recognition Using Smartphones Data set_ downloaded from:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set was downloaded and saved into the working directory as a UCI HAR Dataset folder (path: "~/UCI HAR Dataset"). In order to work, the script needs to be located in the same working directory as the UCI HAR Dataset folder. When the script is run the output file (_tidymeandata.txt_) is created into the set working directory.

## Script design and explanation
The functions and commands performed by the script are explained in chronological order. The run_analysis.R script itself also contains comments explaining what each part of the code does.

1. The script loads the "reshape2" package needed to perform the _melt()_ and _dcast()_ commands later in the code.
2. The script reads the 8 text files of input data from the UCI HAR Dataset folder in the working directory into R using the _read.table()_ function.
3. From the imported features.txt file, the features containing mean and standard deviation measurements are selected using the _grep()_ command.
4. Activity names loaded from the activity_labels.txt  file are changed from upper case letters into lower case letters and underscores are removed with _tolower()_ and _gsub()_ .
5. The training and test activity ID numbers are combined a single column using _rbind()_.
6. Merges the newly created activity ID column with the corresponding activity names into a single column of performed activities and name the new column as "Activity".
7. Similarly, the training and test results data are combined by their columns by binding the rows together with _rbind()_.
8. This merged result data frame is then subsetted to only include the selected mean and standard deviation measurements and the variables are named with their descriptive feature names.
9. These feature names are transformed  by using _gsub()_ to replace the abbreviations of _Acc, Mag, Freq_ and _std_ into their full written form, remove hyphens and underscores from the variable names, and capitalize the starting letters of each word.
10. The training and test subject data is combined with the _rbind()_ command and the column is named as "Subject".
11. All three merged data frames (_mergesubject, mergelabels_ and _mergedata_) are merged together by their rows with the _cbind()_ function to create a tidy data set of all the experiment results for all the mean and standard deviation measurements.
12. An independent data set with the averages of each measurement variable for each subject and activity is created by melting the data set containing all the experiment results by each subject and activity with the command _melt()_.
13. From this molten data frame mean values of all the feature measurements are taken for each subject and activity combination and cast into a final tidy data set using the _dcast()_ command.
14. Finally this tidy data set is output and saved as a text file into the working directory with _write.table()_ using _row.name=FALSE_.

## References

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.
