###Merges the training and the test sets to create one data set.
- Training and test sets were merged by rbinding Y-test.txt and Y_train.txt (dataActivity),
subject_train.txt and subject_test.txt (dataSubject), then X_test.txt and X_train.txt (dataFeatures).
- dataSubject was "named" subject, dataActivity "activity"
- dataFeatures was "named" via data in features.txt
- These were all combined horizontally

###Extracts only the measurements on the mean and standard deviation for each measurement. 
- I decided to best satisfy the project requirement, to use only columns with "mean()" and
"std()" in the names.
- Ended up with 68 columns.

###Uses descriptive activity names to name the activities in the data set
- I used the factor() function to replace the activity IDs with the human-readable text
held in activity_labels.txt

###Appropriately labels the data set with descriptive variable names. 
- Accomplished by replacing the exisiting abbreviations in the column names with the full
terms.

###From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- Using the aggregate function, I took the mean of each variable
- It was then ordered first by activity, then subject
- The data is saved in tidydata.txt which should appear in your working directory.
- A copy is in the repository.



###Variable names:

timeBodyAccelerometer-mean()-X                
timeBodyAccelerometer-mean()-Y                
timeBodyAccelerometer-mean()-Z                
timeBodyAccelerometer-std()-X                
timeBodyAccelerometer-std()-Y                
timeBodyAccelerometer-std()-Z                 
timeGravityAccelerometer-mean()-X             
timeGravityAccelerometer-mean()-Y             
timeGravityAccelerometer-mean()-Z             
timeGravityAccelerometer-std()-X              
timeGravityAccelerometer-std()-Y              
timeGravityAccelerometer-std()-Z             
timeBodyAccelerometerJerk-mean()-X           
timeBodyAccelerometerJerk-mean()-Y          
timeBodyAccelerometerJerk-mean()-Z            
timeBodyAccelerometerJerk-std()-X             
timeBodyAccelerometerJerk-std()-Y            
timeBodyAccelerometerJerk-std()-Z            
timeBodyGyroscope-mean()-X                   
timeBodyGyroscope-mean()-Y                    
timeBodyGyroscope-mean()-Z                    
timeBodyGyroscope-std()-X                     
timeBodyGyroscope-std()-Y                     
timeBodyGyroscope-std()-Z                     
timeBodyGyroscopeJerk-mean()-X                
timeBodyGyroscopeJerk-mean()-Y                
timeBodyGyroscopeJerk-mean()-Z                
timeBodyGyroscopeJerk-std()-X                 
timeBodyGyroscopeJerk-std()-Y                 
timeBodyGyroscopeJerk-std()-Z                 
timeBodyAccelerometerMagnitude-mean()         
timeBodyAccelerometerMagnitude-std()          
timeGravityAccelerometerMagnitude-mean()      
timeGravityAccelerometerMagnitude-std()       
timeBodyAccelerometerJerkMagnitude-mean()     
timeBodyAccelerometerJerkMagnitude-std()      
timeBodyGyroscopeMagnitude-mean()             
timeBodyGyroscopeMagnitude-std()              
timeBodyGyroscopeJerkMagnitude-mean()         
timeBodyGyroscopeJerkMagnitude-std()          
frequencyBodyAccelerometer-mean()-X           
frequencyBodyAccelerometer-mean()-Y           
frequencyBodyAccelerometer-mean()-Z           
frequencyBodyAccelerometer-std()-X            
frequencyBodyAccelerometer-std()-Y            
frequencyBodyAccelerometer-std()-Z           
frequencyBodyAccelerometerJerk-mean()-X       
frequencyBodyAccelerometerJerk-mean()-Y       
frequencyBodyAccelerometerJerk-mean()-Z       
frequencyBodyAccelerometerJerk-std()-X        
frequencyBodyAccelerometerJerk-std()-Y        
frequencyBodyAccelerometerJerk-std()-Z       
frequencyBodyGyroscope-mean()-X               
frequencyBodyGyroscope-mean()-Y               
frequencyBodyGyroscope-mean()-Z               
frequencyBodyGyroscope-std()-X               
frequencyBodyGyroscope-std()-Y                
frequencyBodyGyroscope-std()-Z               
frequencyBodyAccelerometerMagnitude-mean()    
frequencyBodyAccelerometerMagnitude-std()     
frequencyBodyAccelerometerJerkMagnitude-mean()
frequencyBodyAccelerometerJerkMagnitude-std() 
frequencyBodyGyroscopeMagnitude-mean()        
frequencyBodyGyroscopeMagnitude-std()         
frequencyBodyGyroscopeJerkMagnitude-mean()    
frequencyBodyGyroscopeJerkMagnitude-std()    
subject - *Which of the test subjects the data "belongs" to*                                  
activity - *Which activity the test subjects were doing*

###Activities:
- Walking
- Walking Upstairs
- Walking Downstairs
- Sitting
- Standing
- Laying

### Excerpts from the included README.txt:
>####Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
>www.smartlab.ws
==================================================================

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

>For each record it is provided:
======================================

>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

>The dataset includes the following files:
=========================================

>- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

>License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

>[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

>This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

>Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
