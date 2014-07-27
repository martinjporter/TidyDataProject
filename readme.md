# Description of run_analysis.R

 The *run_analysis* R script is used to subset and tidy daya from the **Human Activity Recognition Using Smartphones Dataset** by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto.

Requirements of the script are to processes the data in the following manner: (not necessarily in this order)

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

**NOTE all data files are in the working directory**

## Script operation

Before reading main data files some utility variables and filters for the data files are prepared. Firstly the activities_labels file and activity data is read and used to create descriprive factor levels for the activity data. Subject data is also read but left as integer values.

Next the data names (features) were read. The *grepl* function was used to create a "filter" vector to sort out which features to keep by selecting only those containing the strings "mean()" or "std()". The word mean appeared in other terms but these were deemed to relevant in the context of this assignment. Of the original 561 features only 66 were selected.

Once the main data were read, filtering was applied. A new set of 66 data names was also extracted from the original features set. Now to put it all together by combining each *test* vector/set with its corresponding *train* version. Activity, subject.no.and data were combined into a single data.frame and proper column/data names added.

Data was reshaped using the *melt* function from the *reshape2* package. The Activity and subject number were taken as IDs. The result was saved as a plain TXT file, consistant with the input data. 

## Averages

The *aggregate* function was used to process the cleaned data to get averages (mean). All but the final "values" column were used as grouping elements. The resultant data frame was subset to remove extra columns and suitable column names applied before saving.