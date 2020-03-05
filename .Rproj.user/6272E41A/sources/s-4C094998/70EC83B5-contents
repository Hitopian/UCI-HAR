# Code Book for UCI HAR Dataset

As reported by [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.   
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.   
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.    
The experiments have been video-recorded to label the data manually.     
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The relevant data files are:

* *features.txt*: List of all features.
* *activity_labels.txt*: Links the class labels with their activity name.
* *train/subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* *train/X_train.txt*: Training set.
* *train/y_train.txt*: Training labels.
* *test/X_test.txt*: Test set.
* *test/y_test.txt*: Test labels.
Following the data manipulation requirements of the assignment:

**1. Merge the training and the test sets to create one data set.**

At first I prepared tidy data both for training and data set separately:
 
* binding columns of subject, X and Y (activity id):
  * training: 7,352 obs. and 563 variables (subject_id + features + activity_id)
  * test: 2,947 obs and 563 variables
* renaming the features with the list of the features

Then I merged the two tables (rbind) into one table (`tb1`): **10,299** obs. and **563** variables.

**2. Extract only the measurements on the mean and standard deviation for each measurement.**

Apart from "subject_id" and "activity_id", all the other column names have been filtered by checking the ".mean." or ".std." substring.   
The outcome is a table (`tb2`) of 10,299 rows and **68** variables overall.   

**3. Use descriptive activity names to name the activities in the data set**

The previous table is then merged with the "activity_labels": the outcome (`tb3`) is then the previous table with the activity_id column replaced by the new activity_name column.

Activity_labels:

1.  WALKING
2.	WALKING_UPSTAIRS
3.	WALKING_DOWNSTAIRS
4.	SITTING
5.	STANDING
6.	LAYIN

**4. Appropriately label the data set with descriptive variable names.**

In order to make the feature names more readable I mainly separated the technical terms by using underscores (e.g.  *tBodyGyroJerk.mean...X* becomes *time_body_gyro_jerk_mean_x*)

In the detail, I adopted the following renaming rules:

* initial "t" >>> time
* initial "f" >>> freq
* dots >>> get rid of 
* time/freq, Body/Gravity, Acc/Gyro, Jerk, Mag, mean/std, X/Y/Z  >>> keep sequence + terms separated by "_" + all lowercase
* "_body_body" exception case >>> replaced with "_body"

The outcome is the table (`tb4`) with the header names listed in the Appendix:

**5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject. **

The output table (`tb5`) is the combination of all subject_id and activity_name for a total of **180** rows (30 subjects by 6 activities) and 68 variables.

The table is then saved into the working directory as **tb_final.txt**

## Appendix: *tb_final headers*

[1] subject_id                  
 [2] time_body_acc_mean_x        
 [3] time_body_acc_mean_y        
 [4] time_body_acc_mean_z        
 [5] time_body_acc_std_x         
 [6] time_body_acc_std_y         
 [7] time_body_acc_std_z         
 [8] time_gravity_acc_mean_x     
 [9] time_gravity_acc_mean_y     
[10] time_gravity_acc_mean_z     
[11] time_gravity_acc_std_x      
[12] time_gravity_acc_std_y      
[13] time_gravity_acc_std_z      
[14] time_body_acc_jerk_mean_x   
[15] time_body_acc_jerk_mean_y   
[16] time_body_acc_jerk_mean_z   
[17] time_body_acc_jerk_std_x    
[18] time_body_acc_jerk_std_y    
[19] time_body_acc_jerk_std_z    
[20] time_body_gyro_mean_x       
[21] time_body_gyro_mean_y       
[22] time_body_gyro_mean_z       
[23] time_body_gyro_std_x        
[24] time_body_gyro_std_y        
[25] time_body_gyro_std_z        
[26] time_body_gyro_jerk_mean_x  
[27] time_body_gyro_jerk_mean_y  
[28] time_body_gyro_jerk_mean_z  
[29] time_body_gyro_jerk_std_x   
[30] time_body_gyro_jerk_std_y   
[31] time_body_gyro_jerk_std_z   
[32] time_body_acc_mag_mean      
[33] time_body_acc_mag_std       
[34] time_gravity_acc_mag_mean   
[35] time_gravity_acc_mag_std    
[36] time_body_acc_jerk_mag_mean    
[37] time_body_acc_jerk_mag_std  
[38] time_body_gyro_mag_mean     
[39] time_body_gyro_mag_std      
[40] time_body_gyro_jerk_mag_mean     
[41] time_body_gyro_jerk_mag_std     
[42] freq_body_acc_mean_x        
[43] freq_body_acc_mean_y        
[44] freq_body_acc_mean_z        
[45] freq_body_acc_std_x         
[46] freq_body_acc_std_y         
[47] freq_body_acc_std_z         
[48] freq_body_acc_jerk_mean_x   
[49] freq_body_acc_jerk_mean_y   
[50] freq_body_acc_jerk_mean_z   
[51] freq_body_acc_jerk_std_x    
[52] freq_body_acc_jerk_std_y    
[53] freq_body_acc_jerk_std_z    
[54] freq_body_gyro_mean_x       
[55] freq_body_gyro_mean_y       
[56] freq_body_gyro_mean_z       
[57] freq_body_gyro_std_x        
[58] freq_body_gyro_std_y        
[59] freq_body_gyro_std_z        
[60] freq_body_acc_mag_mean      
[61] freq_body_acc_mag_std       
[62] freq_body_acc_jerk_mag_mean      
[63] freq_body_acc_jerk_mag_std  
[64] freq_body_gyro_mag_mean     
[65] freq_body_gyro_mag_std      
[66] freq_body_gyro_jerk_mag_mean     
[67] freq_body_gyro_jerk_mag_std    
[68] activity_name     




