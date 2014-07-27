## This R script uses the Human Activity Recognition Using Smartphones Dataset
#  (Version 1.0) and processes it in the following manner: (not necessarily in this order)
#  1-Merges the training and the test sets to create one data set.
#  2-Extracts only the measurements on the mean and standard deviation for each measurement. 
#  3-Uses descriptive activity names to name the activities in the data set
#  4-Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each 
#  activity and each subject. 

### >>>> NOTE all data files are in the working directory

# Before reading main data files prepare some utility variables and filters for the data
# first the activities labels
activities <- read.table("activity_labels.txt", col.names=c("i","name"), 
                         stringsAsFactors=FALSE)
# get activities data and convert to factor - test & train
temp <- read.table("y_test.txt")[,1]
test.activities <- factor(temp,levels=activities$i)
levels(test.activities)<- activities$name
temp <- read.table("y_train.txt")[,1]
train.activities <- factor(temp,levels=activities$i)
levels(train.activities)<- activities$name

# get subject data but leave as number
test.subject <- read.table("subject_test.txt")[,1] 
train.subject <- read.table("subject_train.txt")[,1] 

# need to get data names (features) to sort out which to keep
features <- read.table("features.txt",  stringsAsFactors=FALSE)[,2]
# and a filter to select only "mean()" and "std()"
filter <- grepl("mean[(][)]|std[(][)]", features, perl=TRUE)

# read the main data and apply filtering, to features also!
temp <- read.table("x_test.txt")
test.data <- temp[,filter]
temp <- read.table("x_train.txt")
train.data <- temp[,filter]
datanames <- features[filter]

# now to put it all together, including proper column names.
activity <- factor(c(levels(test.activities)[test.activities],
                     levels(train.activities)[train.activities]))
subject.no. <- c(test.subject, train.subject)
temp <- data.frame(activity, subject.no., rbind(test.data, train.data))
names(temp) <- c("activity","subject.no.",datanames)

# reshape and save
library(reshape2)
clean <- melt(temp, id.vars=c(1,2))
write.table(clean, file="cleandata.txt", row.names=FALSE, quote=FALSE)

# aggregate the data to get averages
temp <- aggregate(clean, by=list(clean[,1],clean[,2],clean[,3]), FUN=mean)
# remove extra columns an rename
means <- temp[,c(1,2,3,7)]
names(means) <- c("activity","subject.no.","variable","average")

# and save
write.table(mean, file="cleanaverage.txt", row.names=FALSE, quote=FALSE)

# THE END