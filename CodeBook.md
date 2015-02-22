# CodeBook - Tidy dataset

This is a code book helps describes the variables, the data, and other transformations and work performed by `run_analysis.R` to clean up the data.

## Data Set Summary

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

* [Detailed Summary](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* [Original DataSet](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

## Transformation Instructions

There are five parts:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Transformation Steps:

* Requires `plyr` library
* Loads both x, y, and subject test and train data and merges them into a singel set
* Labels the singel merged set using feature labels
* Extracts the mean and standard deviation values
* Adds activity labels to the extracted dataset
* Refines the variable names of the extracted dataset
* Creates a tidy data set based on the given filename

## DataSet Variables Information

The tidy data set contains observations with 81 variables:
1. ActivityName: Activity being performed
2. SubjectID: subject from whom data was collected
3. Time-BodyAcc.mean.X
4. Time-BodyAcc.mean.Y
5. Time-BodyAcc.mean.Z
6. Time-BodyAcc.std.X
7. Time-BodyAcc.std.Y
8. Time-BodyAcc.std.Z
9. Time-GravityAcc.mean.X
10. Time-GravityAcc.mean.Y
11. Time-GravityAcc.mean.Z
12. Time-GravityAcc.std.X
13. Time-GravityAcc.std.Y
14. Time-GravityAcc.std.Z
15. Time-BodyAccJerk.mean.X
16. Time-BodyAccJerk.mean.Y
17. Time-BodyAccJerk.mean.Z
18. Time-BodyAccJerk.std.X
19. Time-BodyAccJerk.std.Y
20. Time-BodyAccJerk.std.Z
21. Time-BodyGyro.mean.X
22. Time-BodyGyro.mean.Y
23. Time-BodyGyro.mean.Z
24. Time-BodyGyro.std.X
25. Time-BodyGyro.std.Y
26. Time-BodyGyro.std.Z
27. Time-BodyGyroJerk.mean.X
28. Time-BodyGyroJerk.mean.Y
29. Time-BodyGyroJerk.mean.Z
30. Time-BodyGyroJerk.std.X
31. Time-BodyGyroJerk.std.Y
32. Time-BodyGyroJerk.std.Z
33. Time-BodyAccMag.mean
34. Time-BodyAccMag.std
35. Time-GravityAccMag.mean
36. Time-GravityAccMag.std
37. Time-BodyAccJerkMag.mean
38. Time-BodyAccJerkMag.std
39. Time-BodyGyroMag.mean
40. Time-BodyGyroMag.std
41. ime-BodyGyroJerkMag.mean
42. Time-BodyGyroJerkMag.std
43. Frequency-BodyAcc.mean.X
44. Frequency-BodyAcc.mean.Y
45. Frequency-BodyAcc.mean.Z
46. Frequency-BodyAcc.std.X
47. Frequency-BodyAcc.std.Y
48. Frequency-BodyAcc.std.Z
49. Frequency-BodyAcc.meanFreq-X
50. Frequency-BodyAcc.meanFreq-Y
51. Frequency-BodyAcc.meanFreq-Z
52. Frequency-BodyAccJerk.mean.X
53. Frequency-BodyAccJerk.mean.Y
54. Frequency-BodyAccJerk.mean.Z
55. Frequency-BodyAccJerk.std.X
56. Frequency-BodyAccJerk.std.Y
57. Frequency-BodyAccJerk.std.Z
58. Frequency-BodyAccJerk.meanFreq-X
59. Frequency-BodyAccJerk.meanFreq-Y
60. Frequency-BodyAccJerk.meanFreq-Z
61. Frequency-BodyGyro.mean.X
62. Frequency-BodyGyro.mean.Y
63. Frequency-BodyGyro.mean.Z
64. Frequency-BodyGyro.std.X
65. Frequency-BodyGyro.std.Y
66. Frequency-BodyGyro.std.Z
67. Frequency-BodyGyro.meanFreq-X
68. Frequency-BodyGyro.meanFreq-Y
69. Frequency-BodyGyro.meanFreq-Z
70. Frequency-BodyAccMag.mean
71. Frequency-BodyAccMag.std
72. Frequency-BodyAccMag.meanFreq
73. Frequency-BodyBodyAccJerkMag.mean
74. Frequency-BodyBodyAccJerkMag.std
75. Frequency-BodyBodyAccJerkMag.meanFreq
76. Frequency-BodyBodyGyroMag.mean
77. Frequency-BodyBodyGyroMag.std
78. Frequency-BodyBodyGyroMag.meanFreq
79. Frequency-BodyBodyGyroJerkMag.mean
80. Frequency-BodyBodyGyroJerkMag.std
81. Frequency-BodyBodyGyroJerkMag.meanFreq