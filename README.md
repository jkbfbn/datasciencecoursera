Course project: Getting and cleaning data
========================================

The R script run_analysis.R does the following. 
-----------------------------------------------
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Process 
-----------------------------------------------
1. Load and merge the data sets from test and training
2. Load and merge the activity indices from test and training
3. replace activity indices with decriptive names from activity_labels.txt
4. Load and merge the labels (subjects) from test and training
5. Subset the data set (from 1.) to the relevant variables
6. Name the variables
7. Add activity and subject labels (from 3. & 4.) to the data set
8. -> First step finished: Tidy data set with readable variable names
9. Create a second data set with the average of each variable for each activity and each subject