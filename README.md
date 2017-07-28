This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

Step 1> Download the dataset if it does not already exist in the working directory
Step 2 a>Loads both the training and test datasets, keeping only those columns which reflect a mean or standard deviation
            b>Load the activity and feature info
Step3> Loads the activity and subject data for each dataset, and merges those columns with the dataset
Merges the two datasets
Step 4>Using grepl to find records matching mean and standard deviation in features file & Extract those records
step5>replacing numeric values with lookup value from activity.txt
Step 6> Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.
Step 7>The end result is shown in the file tidy.txt.