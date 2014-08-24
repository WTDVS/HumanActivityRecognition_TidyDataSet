READ.MD
Source Data Attribution:
-------------------------

Human Activity Recognition Using SmartPhones Dataset 
version 1.0 created by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


Data Analysis
--------------
This data analysis takes the and performs two sets of data analysis after applying some tidy data transformations
to add descriptive activity names replacing the numeric code values used in the original data set
and adds appropriate descriptive variable names to improve visibility to the use of 
the variables:

1)  The first Analysis merges the training and test datasets into one dataset
    and extracts only measurements for mean and standard deviation for each measure.

2)  The second analysis calculates the average for all activity variables for each subject in the 
    combined data set and writes this result to a file.

An R script ( run_analysis.R ) performs the tidy data set operations described 
above after reading in both the training and test data sets and merging into a common format.
It performs the first analysis described above and then the second analysis and writes the 
result to  average_all_activity_variables_by_subject.txt
  
