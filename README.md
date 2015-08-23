#README

This document describes in detail the assumptions, dependencies, input and output data files, and process for the script `run_analysis.R`. 

--

###Assumptions

Features were identified as mean and standard deviation estimates if their label in the file `features.txt` contained the literal string *mean* or *std*, respectively. In addition, feature labels that started with *fBodyBody* were assumed to be erroneous and removed from the data.

###Dependencies

The script depends on the libraries `data.table`, `dplyr`, and `reshape2` and it must be located in the root folder.

###Input Files and Folder Structure

The script assumes the following folder structure:

```
.
├── UCI\ HAR\ Dataset
│   ├── activity_labels.txt
│   ├── features.txt
│   ├── test
│   |   ├── X_test.txt
│   │   ├── subject_test.txt
│   │   └── y_test.txt
│   └── train
│       ├── X_train.txt
│       ├── subject_train.txt
│       └── y_train.txt
```

The script requires the following input files:

1. `activity_labels.txt` - Links the class labels with the their activity name.
2. `features.txt` - List of all features.
3. `subject_{train,test}.txt` - Each row identifies the subject who performed the activity for each window sample.
4. `X_{train,test}.txt` - Features data.
5. `y_{train,test}.txt` - Labels for the `X_{train,test}.txt` data sets.

###Output Data Files

The final output of the script is the following files:

1. `tidy_data.txt` - A data set that combines and standardizes the input data sets.
2. `tidy_mean.txt` - The calculated mean by *subject_id* and *activity* for the features listed in the data set `tidy_data`.

--

###Script Process

1. Load the libraries `data.table`, `dplyr`, and `reshape2`. Set the base directory to `UCI\ HAR\ Dataset`, the test directory to `UCI \ HAR\ Dataset/test` and train directory to `UCI\ HAR\ Dataset/train`.

2. Define the function `make_table` that reads in a file and returns a data table. This function is used for all read in file operations. <br /> *Note: See the function definition in the script for full function options.*

3. Read in the file `activity_lables.txt` to the data table `activity` and in order set the column names to *activity_id* and *activity*. Set the key for the data table to *activity_id*. 

4. To improve readability for each observation in the column *activity* from the data table `activity` replace "_" with " ".

5. Read in the file `features.txt` to the data table `features` and in order set the column names to *variable_id* and *variable*.

6. For each observation  in the column *variable* from the data table `features` remove "()", ")" and replace "(", "-", and "," with "_".

7. Create a character vector `feature_names` from the column *variable* in the data table `features`. This character vector will be used in later steps to set the column names of data tables.

8. Define the character vector `column_order` as (*subject\_id*, *activity_id*, *activity*, *data\_source*, *valid_features*). The element *valid_features* refers to the elements in the character vector `feature_names` that contain the literal string *mean* or *std* and do not begin with *fBodyBody*. This character vector will used in later steps to set the column order of data tables.

9. For the test and train data files do the following:

	1. Read in the file `subject_{train,test}.txt` to the data table `subject` and set the column name to *subject_id*.
	2. Read in the file `X_{train,test}.txt` to the data table `measurements` and set the column names using the character vector `feature_names`. Subset to the columns that contain the literal string *mean* or *std* in the column name and do not begin with *fBodyBody*.
	3. Read in the file `y_{train,test}.txt` to the data table `movements` and set the column name to *activity_id*.
	4. Create the data table `{train,test}_data` by combining the columns of the data tables `subject`, `movements`, and `measurements` and merging on the data table `activity` by the key *activity_id*.
	5. Set the column order for the data table `{train,test}_data` using the character vector `column_order`. 

10. Create the data table `tidy_data` by combining the rows of the data tables `test_data` and `train_data` and removing the column *activity_id*.

11. Sort the data table `tidy_data` by *subject_id* and *activity*.

12. Calculate the mean of each feature in the data table `tidy_data` by *subject_id* and *activity*. Reshape the resulting data table from a wide table to a narrow table and output the results to the data table `mean_tidy`.

13. Write to the root directory the data tables `tidy_data` and `tidy_mean` to the files `tidy_data.txt` and `tidy_mean.txt`, respectively.

--
