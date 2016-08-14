#Code Book

##Getting and Cleaning Data Course Assignment

###Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Source of Original Data

[link] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Cleaning Process

The script `run_analysis.R` performs a cleaning operation on the data through implementation of the following processes:

1. Checking for local copy of data and, if absent, downloading data from the web source before unzipping the file.
2. Merging the training and test data sets into a single data set.
3. Merging the subject identifier information from the training and test data sets.
4. Merging the activity labels from the training and test data sets.
5. Reading in the names of the variables from the `features.txt` file.
6. Selecting only the variables concerning the mean and standard deviation data from the main data set.
7. Making the names of the variables more readable and attaching them to the mean/sd data set.
8. Retrieving the names of the activity variables from `activity_labels.txt` and making them more readable.
9. Attaching the names of the activity variables to the data set.
10. Naming the columns 'activity' and 'subject' with the correct names.
11. Merging all labels the activity and subject columns with the main data set, creating the complete `tidy.data` data set.
12. Writing the `tidy.data` data set to a text file.
13. Calculating the average of the mean and sd data from the `tidy.data` data set and adding them to a new `tidy.data.averages` data set.
14. Writing the `tidy.data.averages` data set to a text file.

### run_analysis.R variable Descriptions

Variable Name | Description
--------------|-------------
x.train | Measurement data contained in X_train.txt
x.test | Measurement data contained in X_test.txt
x.all | Combined data from the above 2 files
subject.train | Subject identifier information from subject_train.txt
subject.test | Subject identifier information from subject_test.txt
subject.all | Combined subject identifier information from above 2 files 
y.train | Activity labels from y_train.txt
y.test | Activity labels from y_test.txt
y.all | Combined activity labels from above 2 files
features.full | Complete list of variables measured during experiments
features | Refinement of 'features.full' to contain only column of interest
features.needed | Selects only mean and st.dev from 'features' 
x.mean.std | Selection of only mean and st.dev from full data set
activities | Descriptive names for activities from activity_labels.txt
tidy.data | Tidied version of final dataset, ready for writing
tidy.data.averages | Modified 'tidy.data' containing variable averages

### Output 

Running the `run_analysis.R` script will create two text files as output. These are:

`tidy-data.txt` which is a tidy data set derived from the original data and containing only the mean and standard deviation for each measurement.

`tidy-data-averages.txt` which is a tidy data set containing the averages of each variable for each activity and each subject. It is derived from `tidy.data`.