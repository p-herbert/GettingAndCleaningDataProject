#Getting and Cleaning Data Project
--

#Study Design

Human Activity Recognition Using Smartphones Dataset <br />
Version 1.0

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKING DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Authors: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

####Contact Information:
Smartlab - Non Linear Complex Systems Laboratory <br />
DITEN - Universit‡ degli Studi di Genova. <br />
Via Opera Pia 11A, I-16145, Genoa, Italy. <br />
activityrecognition@smartlab.ws <br /> 
www.smartlab.ws

--

#Codebook

###Selection Criteria

Features were identified as mean and standard deviation estimates if their label in the file `features.txt` contained the literal string *mean* or *std*, respectively. In addition, feature labels that started with *fBodyBody* were assumed to be erroneous and removed from the data.

###File - tidy_data.txt

| Variable    | Position | Description | Type | Values |
|:------------|:--------:|:------------|:----:|:------:|
| subject_id  | 1 | Uniquely identifies each individual | Integer | 1 - 30 |
| activity    | 2 | Physical activity performed | Categorical | WALKING <br /> WALKING UPSTAIRS <br /> WALKING DOWNSTAIRS <br /> SITTING <br /> STANDING |
| tBodyAcc\_mean_X | 3 | Body linear acceleration mean, x-axis. | Numeric | [-1,1] |
| tBodyAcc\_mean_Y | 4 | Body linear acceleration mean, y-axis. | Numeric | [-1,1] |
| tBodyAcc\_mean_Z | 5 | Body linear acceleration mean, z-axis. | Numeric | [-1,1] |
| tBodyAcc\_std_X | 6 | Body linear acceleration standard deviation, x-axis. | Numeric | [-1,1] |
| tBodyAcc\_std_Y | 7 | Body linear acceleration standard deviation, y-axis. | Numeric | [-1,1] |
| tBodyAcc\_std_Z | 8 | Body linear acceleration standard deviation, z-axis. | Numeric | [-1,1] |
| tGravityAcc\_mean_X | 9 | Gravity linear acceleration mean, x-axis. | Numeric | [-1,1] |
| tGravityAcc\_mean_Y | 10 | Gravity linear acceleration mean, y-axis. | Numeric | [-1,1] |
| tGravityAcc\_mean_Z | 11 | Gravity linear acceleration mean, z-axis. | Numeric | [-1,1] |
| tGravityAcc\_std_X | 12 | Gravity linear acceleration standard deviation, x-axis. | Numeric | [-1,1] |
| tGravityAcc\_std_Y | 13 | Gravity linear acceleration standard deviation, y-axis. | Numeric | [-1,1] |
| tGravityAcc\_std_Z | 14 | Gravity linear acceleration standard deviation, z-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_mean_X | 15 | Body linear jerk mean, x-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_mean_Y | 16 | Body linear jerk mean, y-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_mean_Z | 17 | Body linear jerk mean, z-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_std_X | 18 | Body linear jerk standard deviation, x-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_std_Y | 19 | Body linear jerk standard deviation, y-axis. | Numeric | [-1,1] |
| tBodyAccJerk\_std_Z | 20 | Body linear jerk standard deviation, z-axis. | Numeric | [-1,1] |
| tBodyGyro\_mean_X | 21 | Body angular acceleration mean, x-axis. | Numeric | [-1,1] |
| tBodyGyro\_mean_Y | 22 | Body angular acceleration mean, y-axis. | Numeric | [-1,1] |
| tBodyGyro\_mean_Z | 23 | Body angular acceleration mean, z-axis. | Numeric | [-1,1] |
| tBodyGyro\_std_X | 24 | Body angular acceleration standard deviation, x-axis. | Numeric | [-1,1] |
| tBodyGyro\_std_Y | 25 | Body angular acceleration standard deviation, y-axis. | Numeric | [-1,1] |
| tBodyGyro\_std_Z | 26 | Body angular acceleration standard deviation, z-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_mean_X | 27 | Body angular jerk mean, x-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_mean_Y | 28 | Body angular jerk mean, y-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_mean_Z | 29 | Body angular jerk mean, z-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_std_X | 30 | Body angular jerk standard deviation, x-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_std_Y | 31 | Body angular jerk standard deviation, y-axis. | Numeric | [-1,1] |
| tBodyGyroJerk\_std_Z | 32 | Body angular jerk standard deviation, z-axis. | Numeric | [-1,1] |
| tBodyAccMag\_mean | 33 | Body linear acceleration magnitude mean. | Numeric | [-1,1] |
| tBodyAccMag\_std | 34 | Body linear acceleration magnitude standard deviation. | Numeric | [-1,1] |
| tGravityAccMag\_mean | 35 | Gravity linear acceleration magnitude mean. | Numeric | [-1,1] |
| tGravityAccMag\_std | 36 | Gravity linear acceleration magnitude standard deviation. | Numeric | [-1,1] |
| tBodyAccJerkMag\_mean | 37 | Body linear jerk magnitude mean. | Numeric | [-1,1] |
| tBodyAccJerkMag\_std | 38 | Body linear jerk magnitude standard deviation. | Numeric | [-1,1] |
| tBodyGyroMag\_mean | 39 | Body angular acceleration magnitude mean. | Numeric | [-1,1] |
| tBodyGyroMag\_std | 40 | Body angular acceleration magnitude standard deviation. | Numeric | [-1,1] |
| tBodyGyroJerkMag\_mean | 41 | Body angular jerk magnitude mean. | Numeric | [-1,1] |
| tBodyGyroJerkMag\_std | 42 | Body angular jerk magnitude standard deviation. | Numeric | [-1,1] |
| fBodyAcc\_mean_X | 43 | FFT - body linear acceleration mean, x-axis. | Numeric | [-1,1] |
| fBodyAcc\_mean_Y | 44 | FFT - body linear acceleration mean, y-axis. | Numeric | [-1,1] |
| fBodyAcc\_mean_Z | 45 | FFT - body linear acceleration mean, z-axis. | Numeric | [-1,1] |
| fBodyAcc\_std_X | 46 | FFT - body linear acceleration standard deviation, x-axis. | Numeric | [-1,1] |
| fBodyAcc\_std_Y | 47 | FFT - body linear acceleration standard deviation, y-axis. | Numeric | [-1,1] |
| fBodyAcc\_std_Z | 48 | FFT - body linear acceleration standard deviation, z-axis. | Numeric | [-1,1] |
| fBodyAcc\_meanFreq_X | 49 | FFT - body linear acceleration mean frequency, x-axis. | Numeric | [-1,1] |
| fBodyAcc\_meanFreq_Y | 50 | FFT - body linear acceleration mean frequency, y-axis. | Numeric | [-1,1] |
| fBodyAcc\_meanFreq_Z | 51 | FFT - body linear acceleration mean frequency, z-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_mean_X | 52 | FFT - body linear jerk mean, x-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_mean_Y | 53 | FFT - body linear jerk mean, y-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_mean_Z | 54 | FFT - body linear jerk mean, z-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_std_X | 55 | FFT - body linear jerk standard deviation, x-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_std_Y | 56 | FFT - body linear jerk standard deviation, y-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_std_Z | 57 | FFT - body linear jerk standard deviation, z-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_meanFreq_X | 58 | FFT - body linear jerk mean frequency, x-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_meanFreq_Y | 59 | FFT - body linear jerk mean frequency, y-axis. | Numeric | [-1,1] |
| fBodyAccJerk\_meanFreq_Z | 60 | FFT - body linear jerk mean frequency, z-axis. | Numeric | [-1,1] |
| fBodyGyro\_mean_X | 61 | FFT - body angular acceleration mean, x-axis. | Numeric | [-1,1] |
| fBodyGyro\_mean_Y | 62 | FFT - body angular acceleration mean, y-axis. | Numeric | [-1,1] |
| fBodyGyro\_mean_Z | 63 | FFT - body angular acceleration mean, z-axis. | Numeric | [-1,1] |
| fBodyGyro\_std_X | 64 | FFT - body angular acceleration standard deviation, x-axis. | Numeric | [-1,1] |
| fBodyGyro\_std_Y | 65 | FFT - body angular acceleration standard deviation, y-axis. | Numeric | [-1,1] |
| fBodyGyro\_std_Z | 66 | FFT - body angular acceleration standard deviation, z-axis. | Numeric | [-1,1] |
| fBodyGyro\_meanFreq_X | 67 | FFT - body angular acceleration mean frequency, x-axis. | Numeric | [-1,1] |
| fBodyGyro\_meanFreq_Y | 68 | FFT - body angular acceleration mean frequency, y-axis. | Numeric | [-1,1] |
| fBodyGyro\_meanFreq_Z | 69 | FFT - body angular acceleration mean frequency, z-axis. | Numeric | [-1,1] |
| fBodyAccMag\_mean | 70 | FFT - body linear acceleration magnitude mean. | Numeric | [-1,1] |
| fBodyAccMag\_std | 71 | FFT - body linear acceleration magnitude standard deviation. | Numeric | [-1,1] |
| fBodyAccMag\_meanFreq | 72 | FFT - body linear acceleration magnitude mean frequency. | Numeric | [-1,1] |

###File - mean_tidy.txt

| Variable    | Position | Description | Type | Values |
|:------------|:--------:|:------------|:----:|:------:|
| subject_id  | 1 | Uniquely identifies each individual | Integer | 1 - 30 |
| activity    | 2 | Physical activity performed | Categorical | WALKING <br /> WALKING UPSTAIRS <br /> WALKING DOWNSTAIRS <br /> SITTING <br /> STANDING |
| variable | 3 | Feature label | Character | Column names 3 - 72 from the file `tidy_data.txt` |
| value | 4 | Mean by subject_id and activity | Numeric | [-1,1] |
