READ ME 

Analysis and data transformation was completed on the data set Human Activity Recognition Using Smartphones Version1.0, published by
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
 
A "trainandtest" data set was created with tranformation that included changing variable names to descriptive name. Changes made include variables that began with "t" were changed to Time, variables that begin with "f" were changed to Frequency, "Acc" was changed to Acceleration in variables in which it was present,  "Mag" was changed to Magnitude in variables in which it was present, and "Gyro" was changed to Gyroscope in variables in which it was present. Resulting variables:

TimeBodyAcceleration-XYZ
TimeGravityAcceleration-XYZ
TimeBodyAccelerationJerk-XYZ
TimeBodyGyroscope-XYZ
TimeBodyGyroscopeJerk-XYZ
TimeBodyAccelerationMagnitude
TimeGravityAccelerationMagnitude
TimeBodyAccelerationJerkMagnitude
TimeBodyGyroscopeMagnitude
TimeBodyGyroscopeJerkMagnitude
FrequencyBodyAcceleration-XYZ
FrequencyBodyAccelerationJerk-XYZ
FrequencyBodyGyroscope-XYZ
FrequencyBodyAccelerationMagnitude
FrequencyBodyAccelerationJerkMagnitude
FrequencyBodyGyroscopeMagnitude
FrequencyBodyGyroscopeJerkMagnitude

Dataset combines the train and test data sets and adds an activity variable that gives desriptive labels for the six activities, per the activity file from the study:
Walking
Walking_Upstairs
Walking_Downstairs
sitting
Standing
Laying

A new data set called "meanstdtrainandtest" was created that only included the average(mean) and standard deviation(std) for each variables and activity. This data set consists of 74 variables.

Another data set called "activityaverage" was created that provided the average by activity for the 73 variables, excluding activity from the "meanstdtrainandtest" data set.

==============================================
Data analysis completed by
RaShanda Goodwin 
Coursera student project: Getting and Cleaning Data
08/19/2018