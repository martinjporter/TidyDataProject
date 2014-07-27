# Code Book for *cleandata.txt*

Data described here is a subset and tidy daya from the **Human Activity Recognition Using Smartphones Dataset** by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto.

The file **cleandata.txt** is a plain space separated text data file containing a single header line containing column names followed by 679734 rows of data. Data columns are as follows:

1. **activity** : Character data describing which of 6 activities were being performed when the data was measured. The data is as given in the original file *activity_labels.txt*.
2. **subject.no.** : Integer ID number for the subject of the measurements. Values from *subject_test.txt* and *subject_train.txt*.
3. **variable** : Character data describing the measurement. These are a subset of those in *features.txt*.
4. **value** : Numeric data value subset from *x_test.txt* and *x_train.txt*.

## Averages

The file **cleanaverage.txt** is a plain space separated text data file containing a single header line containing column names followed by 11880 rows of data. Data columns are as above except for column 4 which is named **average** to reflect its use.