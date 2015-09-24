# Codebook for the Course Project - run_analysis.R script

This codebook describes the data, the variables, and all transformations that have been done to clean up the project data.

## Project Data

The data for the course project was accessed from the _Human Activity Recognition Using Smartphones Data set_ available from:

* http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
        
The UCI HAR DATA SET archive can be downloaded from:

* https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The original data set contains sensor signal information of group of 30 volunteers between the ages of 19-48.  All the volunteers performed six basic physical activities, namely: walking, walking up stairs, walking down stairs, sitting, standing, and laying, while wearing a Samsun Galaxy S II smartphone on their waist. From the smartphone embedded accelerometer and gyroscope 3-axial linear acceleration and 3-axial angular velocity were recorded at a rate of 50Hz. The original data was partitioned by random into a training set (70%) and a test set (30%).

Further information on the original data set can be found in the README.txt file in the downloaded UCI HAR DATASET archive. 

From the downloaded archive the following 8 .txt files were extracted and used in the run_analysis.R script to create the output data:

* activity_labels.txt
* features.txt
* X_train.txt
* Y_train.txt
* Subject_train.txt
* X_test.txt
* Y_test.txt
* subject_test.txt

## Variables

In total 68 variables are used in the output data set of the run_analysis.R script. The first two variables classify the participating subjects and the performed activities. The remaining variables [3-68] contain the mean and the standard deviation values for the recorded features. All feature measurement variables data type is numeric.
     
[1] "Subject" - identifies the person that carried out the experiment with a number from 1 to 30 (integer)             
[2] "Activity" - labels the performed activity with a string expression (character)       
[3] "tBodyAccelerationMeanX"                              
[4] "tBodyAccelerationMeanY"                            
[5] "tBodyAccelerationMeanZ"                             
[6] "tBodyAccelerationStandardDeviationX"                
[7] "tBodyAccelerationStandardDeviationY"                
[8] "tBodyAccelerationStandardDeviationZ"                
[9] "tGravityAccelerationMeanX"                          
[10] "tGravityAccelerationMeanY"                          
[11] "tGravityAccelerationMeanZ"                          
[12] "tGravityAccelerationStandardDeviationX"             
[13] "tGravityAccelerationStandardDeviationY"             
[14] "tGravityAccelerationStandardDeviationZ"             
[15] "tBodyAccelerationJerkMeanX"                         
[16] "tBodyAccelerationJerkMeanY"                         
[17] "tBodyAccelerationJerkMeanZ"                         
[18] "tBodyAccelerationJerkStandardDeviationX"            
[19] "tBodyAccelerationJerkStandardDeviationY"            
[20] "tBodyAccelerationJerkStandardDeviationZ"            
[21] "tBodyGyroMeanX"                                     
[22] "tBodyGyroMeanY"                                     
[23] "tBodyGyroMeanZ"                                     
[24] "tBodyGyroStandardDeviationX"                        
[25] "tBodyGyroStandardDeviationY"                        
[26] "tBodyGyroStandardDeviationZ"                        
[27] "tBodyGyroJerkMeanX"                                 
[28] "tBodyGyroJerkMeanY"                                 
[29] "tBodyGyroJerkMeanZ"                                 
[30] "tBodyGyroJerkStandardDeviationX"                    
[31] "tBodyGyroJerkStandardDeviationY"                    
[32] "tBodyGyroJerkStandardDeviationZ"                    
[33] "tBodyAccelerationMagnitudeMean"                     
[34] "tBodyAccelerationMagnitudeStandardDeviation"        
[35] "tGravityAccelerationMagnitudeMean"                  
[36] "tGravityAccelerationMagnitudeStandardDeviation"     
[37] "tBodyAccelerationJerkMagnitudeMean"                 
[38] "tBodyAccelerationJerkMagnitudeStandardDeviation"    
[39] "tBodyGyroMagnitudeMean"                             
[40] "tBodyGyroMagnitudeStandardDeviation"                
[41] "tBodyGyroJerkMagnitudeMean"                         
[42] "tBodyGyroJerkMagnitudeStandardDeviation"            
[43] "fBodyAccelerationMeanX"                             
[44] "fBodyAccelerationMeanY"                             
[45] "fBodyAccelerationMeanZ"                             
[46] "fBodyAccelerationStandardDeviationX"                
[47] "fBodyAccelerationStandardDeviationY"                
[48] "fBodyAccelerationStandardDeviationZ"                
[49] "fBodyAccelerationJerkMeanX"                         
[50] "fBodyAccelerationJerkMeanY"                         
[51] "fBodyAccelerationJerkMeanZ"                         
[52] "fBodyAccelerationJerkStandardDeviationX"            
[53] "fBodyAccelerationJerkStandardDeviationY"            
[54] "fBodyAccelerationJerkStandardDeviationZ"            
[55] "fBodyGyroMeanX"                                     
[56] "fBodyGyroMeanY"                                     
[57] "fBodyGyroMeanZ"                                     
[58] "fBodyGyroStandardDeviationX"                        
[59] "fBodyGyroStandardDeviationY"                        
[60] "fBodyGyroStandardDeviationZ"                        
[61] "fBodyAccelerationMagnitudeMean"                     
[62] "fBodyAccelerationMagnitudeStandardDeviation"        
[63] "fBodyBodyAccelerationJerkMagnitudeMean"             
[64] "fBodyBodyAccelerationJerkMagnitudeStandardDeviation"   
[65] "fBodyBodyGyroMagnitudeMean"                         
[66] "fBodyBodyGyroMagnitudeStandardDeviation"            
[67] "fBodyBodyGyroJerkMagnitudeMean"                     
[68] "fBodyBodyGyroJerkMagnitudeStandardDeviation"

The descriptive activity expressions were transformed into a more tidy format by:

* removing the underscores from the activity labels
* changing the lettering into lower case
 
The feature measurement variable names were transformed into a more tidy format by:

* removing the underscores and hyphens from the names
* replacing abbreviations (_Acc, Mag, Freq_ and _std_) by their more descriptive full forms (_Acceleration, Magnitude, Frequency_ and _StandardDeviation_)
* capitalizing the starting letters of each word

## References
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.