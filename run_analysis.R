#!/usr/bin/Rscript
# NAME: Peter Herbert 
# FILE: run_analysis.r
# DATE: 2015-08-08
# DESC: Create a Tidy dataset for the 'Human Activity Recognition Using Smartphones Data Set' Project
# LAST Modified: 2015-08-23 12:00:55

############### Set Dependencies ###############
# Import the data.table and dplyr libraries
library(data.table)
library(dplyr)
library(reshape2)

# Set the working directory
base_directory <- "UCI\ HAR\ Dataset"

# Set the path to the test datasets
test_directory = paste(base_directory, "test", sep="/")

# Set the path to the train datasets
train_directory = paste(base_directory, "train", sep="/")

############### Define Functions ###############
## Read in a file and return a data table
make_table <- function(directory, file, col.names, key=NULL,
                       keep.vars=1:ncol(df), ...) {

    # Make the full file name 
    full_file_name = paste(directory, file, sep="/")

    # Read in the file
    df <- read.table(full_file_name, col.names=col.names, check.names=TRUE, ...)

    # Convert the frame to a data table and return
    # Default returns all columns
    DT <- data.table(select(df, keep.vars), keep.rownames=FALSE, 
                     check.names=FALSE, key=key)
    return(DT)
} 

############### Labels and Features ###############
# Read in the file "activity_labels.txt" and set the column names and key
activity <- make_table(directory = base_directory, file = "activity_labels.txt",
                       col.names = c("activity_id", "activity"), key="activity_id")

# Replace "_" with " "
activity[, activity := gsub("_", " ", activity)]

# Read in the file "features.txt" and set the column names
features <- make_table(directory = base_directory, file = "features.txt", 
                       col.names=c("variable_id", "variable"))

# Remove "()", ")" and replace "(,-," with "_"
features[, variable := {tmp <- gsub("\\)", "", gsub("\\()", "", variable)); 
                        gsub("[-,\\(]", "_", tmp)}]

# Make a character vector with the feature variable names
feature_names <- as.vector(features$variable)

## Logic vector for the feature variables that contain either mean or std 
## and do not begin with fBodyBody
keep_logic = c(grepl("mean|std",feature_names) 
               & !grepl("fBodyBody",feature_names))

column_order = c(c("subject_id", "activity_id", "activity"),
                 feature_names[keep_logic])

############### Test Data ###############
# Read in the file "subject_test.txt"
subject <- make_table(directory = test_directory, file = "subject_test.txt", 
                      col.names = "subject_id")

# Read in the file "X_test.txt" and subset the columns
measurements <- make_table(directory = test_directory, file = "X_test.txt", 
                           col.names = feature_names, 
                           keep.vars = setdiff(grep("mean|std", feature_names),
                                              grep("fBodyBody",feature_names)))

# Read in the file "y_test.txt" and set the column name
movements <- make_table(directory = test_directory, file = "y_test.txt",
                        col.names = "activity_id")

# Create a tidy data set for the test files
test_data <- merge(cbind(subject, movements, measurements), 
                   activity,
                   by="activity_id")

# Set the column order
setcolorder(test_data, column_order)

############## Train Data ###############
# Read in the file "subject_train.txt"
subject <- make_table(directory = train_directory, file = "subject_train.txt", 
                     col.names = "subject_id")

# Read in the file "X_train.txt" and subset the columns
measurements <- make_table(directory = train_directory, file = "X_train.txt", 
                          col.names = feature_names, 
                          keep.vars = setdiff(grep("mean|std", feature_names),
                                              grep("fBodyBody",feature_names)))
                                     
# Read in the file "y_train.txt" and set the column name
movements <- make_table(directory = train_directory, file = "y_train.txt",
                        col.names = "activity_id")

# Create a tidy data set for the train files
train_data <- merge(cbind(subject, movements, measurements), 
                    activity, 
                    by="activity_id")

# Set the column order
setcolorder(train_data, column_order)

# Combine the tidy test and train data sets and drop the column "activity_id"
tidy_data <- select(rbind(test_data, train_data), -2)

# Sort the tidy data table by subject_id and activity
tidy_data <- tidy_data[order(subject_id, activity)]

############## Mean Data ###############
# Calculate the mean for each measurement by subject_id, activity
mean_data <- tidy_data[, lapply(.SD, mean), by = c("subject_id", "activity")]

# Reshape the mean data table from a wide file to a narrow file
mean_data <- melt(mean_data, id.vars = c("subject_id", "activity"))

############## Writing Out Data ###############
# Write the tidy data set to the working directory
write.table(tidy_data, paste(getwd(), "tidy_data.txt", sep="/"), quote=FALSE, row.names=FALSE)

# Write the mean data table to the working directory
write.table(mean_data, paste(getwd(), "tidy_mean.txt", sep="/"), quote=FALSE, row.names=FALSE)
