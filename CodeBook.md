# Read the list of features
The list of column names for the training and test data are read from the features.txt file and stored into features dataframe.

# Read the list of activities
The list of activities are read from activity_labels.txt and stored into activity_labels dataframe.
Since the original file didn't have any column names, the column name for this dataframe was set to "Activity_Label".

# Read Training Data : from the files under train folder
X_train.txt data was stored into x_train data frame.
The column names for the data frame are set to the list of columns read into the features dataframe.

The activity data (y_train.txt) was stored into y_train data frame.
The column name for this dataframe was set to "Activity".

The subject data (subject_train.txt) was stored into subject_train data frame.
The column name for this dataframe was set to "Subject".

# The following steps were performed when reading each Inertial signal file.
## Read Inertial signal data : from the files under Inertial signals folder
The total_acc_x_train.txt file data was stored into total_acc_x_train dataframe.

## Append default column names with the file name as prefix
The default column names V1, V2 etc... are updated by appending total_acc_x_train_ as the prefix.
This was done to avoid the column name conflict with data from other Inertial signal files.

The above process of reading the Inertial signal data and appending the column names with the file name as prefix was 
performed for all the files under train/Inertial signals folder. 

# Create the training dataset
The training_dataset was created by column binding the subject_train, y_train, x_train and all the inertial signals dataframes.

# Read Test Data: from files under test folder.
The same steps that were performed to obtain training_dataset was performed on the files under test and test/Inertial Signals folder
to obtain the test_dataset.

# Create Merged Data
A merged dataframe was created by binding the rows from training_dataset and test_dataset.
This result was stored into merged_df dataframe.

# Load dplyr package.
Now that reading the data is done and column names are set and merged data was created, the dplyr package was used to manipulate the data. 
install the package dplyr. As I already had it installed, I just loaded the package.

# convert merged_df to tbl_df.
To take advantage of working with tibbles and dplyr package, I converted the merged_df data frame to tibble and stored it in merged_data.

# Select all mean and standard deviation columns.
To select the list of all mean and standard deviation columns, I used the select function in dplyr to select any 
column with mean or std in its name (casing didnt matter). This data was stored in mean_and_std_columns.

The subject and activity columns are appended to mean_and_std_columns. This was done to help with grouping and summarizing the data in the next steps.
The result was stored into subject_activity_mean_and_std_columns.

# Convert the Activity column entries to use descriptive names
Until now the activity column in subject_activity_mean_and_std_columns is represented by numbers.
To convert the activity column to have descriptive names, match the numbers in the activity column in subject_activity_mean_and_std_columns
with the activity_labels dataframe and select the corresponding description that is stored in the second column.
Assign this description to the activity column value in subject_activity_mean_and_std_columns.


# Create a tidy with the average of each variable for each activity and each subject.
To get the average of each variable for each activity and each subject, group the data in subject_activity_mean_and_std_columns by activity and subject.
This data is stored in tidy_data_set.

Then summarize_all ( summarizes all columns in tidy_data_set) by obtaining mean value for each column ( list(mean)).
The tidy_data_set was reassigned with this new data.

The data in tidy_data_set was sorted by Subject and Activity and the result was stored in tidy_data_set.
This data shows the data for each subject ( participant) and the activity they performed and the mean values obtained for each feature when that participant is performing that activity.