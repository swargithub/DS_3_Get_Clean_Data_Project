############################################################################################
# Requirement #1: Merge the test and training data sets.                                   #   
# Requirement #4: Step1: Appropriately label the dataset with descriptive variable names   #
############################################################################################
# Read the column names
features <- read.delim("./features.txt", header = FALSE, sep = "")

# Read the list of Activities
activity_labels <- read.delim("./activity_labels.txt", header = FALSE, sep = "")
# Set the column name
colnames(activity_labels) <- "Activity_Label"

# Read the training data
x_train <- read.delim("./train/X_train.txt", header = FALSE, sep = "")
colnames(x_train) <- unlist(features[row.names(features), 2])
y_train <- read.delim("./train/y_train.txt", header = FALSE, sep = "")
colnames(y_train) <- "Activity"
subject_train <- read.delim("./train/subject_train.txt", header = FALSE, sep = "")
colnames(subject_train) <- "Subject"
total_acc_x_train <- read.delim("./train/Inertial Signals/total_acc_x_train.txt", header = FALSE, sep = "")
colnames(total_acc_x_train) <- paste("total_acc_x", colnames(total_acc_x_train), sep = "_")
body_acc_x_train <- read.delim("./train/Inertial Signals/body_acc_x_train.txt", header = FALSE, sep = "")
colnames(body_acc_x_train) <- paste("body_acc_x", colnames(body_acc_x_train), sep = "_")
body_gyro_x_train <- read.delim("./train/Inertial Signals/body_gyro_x_train.txt", header = FALSE, sep = "")
colnames(body_gyro_x_train) <- paste("body_gyro_x", colnames(body_gyro_x_train), sep = "_")
total_acc_y_train <- read.delim("./train/Inertial Signals/total_acc_y_train.txt", header = FALSE, sep = "")
colnames(total_acc_y_train) <- paste("total_acc_y", colnames(total_acc_y_train), sep = "_")
body_acc_y_train <- read.delim("./train/Inertial Signals/body_acc_y_train.txt", header = FALSE, sep = "")
colnames(body_acc_y_train) <- paste("body_acc_y", colnames(body_acc_y_train), sep = "_")
body_gyro_y_train <- read.delim("./train/Inertial Signals/body_gyro_y_train.txt", header = FALSE, sep = "")
colnames(body_gyro_y_train) <- paste("body_gyro_y", colnames(body_gyro_y_train), sep = "_")
total_acc_z_train <- read.delim("./train/Inertial Signals/total_acc_z_train.txt", header = FALSE, sep = "")
colnames(total_acc_z_train) <- paste("total_acc_z", colnames(total_acc_z_train), sep = "_")
body_acc_z_train <- read.delim("./train/Inertial Signals/body_acc_z_train.txt", header = FALSE, sep = "")
colnames(body_acc_z_train) <- paste("body_acc_z", colnames(body_acc_z_train), sep = "_")
body_gyro_z_train <- read.delim("./train/Inertial Signals/body_gyro_z_train.txt", header = FALSE, sep = "")
colnames(body_gyro_z_train) <- paste("body_gyro_z", colnames(body_gyro_z_train), sep = "_")
training_dataset <- cbind(subject_train, y_train, x_train, body_acc_x_train, body_acc_y_train, body_acc_z_train, body_gyro_x_train, body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)

# Read the test data
x_test <- read.delim("./test/X_test.txt", header = FALSE, sep = "")
colnames(x_test) <- unlist(features[row.names(features), 2])
y_test <- read.delim("./test/y_test.txt", header = FALSE, sep = "")
colnames(y_test) <- "Activity"
subject_test <- read.delim("./test/subject_test.txt", header = FALSE, sep = "")
colnames(subject_test) <- "Subject"
total_acc_x_test <- read.delim("./test/Inertial Signals/total_acc_x_test.txt", header = FALSE, sep = "")
colnames(total_acc_x_test) <- paste("total_acc_x", colnames(total_acc_x_test), sep = "_")
body_acc_x_test <- read.delim("./test/Inertial Signals/body_acc_x_test.txt", header = FALSE, sep = "")
colnames(body_acc_x_test) <- paste("body_acc_x", colnames(body_acc_x_test), sep = "_")
body_gyro_x_test <- read.delim("./test/Inertial Signals/body_gyro_x_test.txt", header = FALSE, sep = "")
colnames(body_gyro_x_test) <- paste("body_gyro_x", colnames(body_gyro_x_test), sep = "_")
total_acc_y_test <- read.delim("./test/Inertial Signals/total_acc_y_test.txt", header = FALSE, sep = "")
colnames(total_acc_y_test) <- paste("total_acc_y", colnames(total_acc_y_test), sep = "_")
body_acc_y_test <- read.delim("./test/Inertial Signals/body_acc_y_test.txt", header = FALSE, sep = "")
colnames(body_acc_y_test) <- paste("body_acc_y", colnames(body_acc_y_test), sep = "_")
body_gyro_y_test <- read.delim("./test/Inertial Signals/body_gyro_y_test.txt", header = FALSE, sep = "")
colnames(body_gyro_y_test) <- paste("body_gyro_y", colnames(body_gyro_y_test), sep = "_")
total_acc_z_test <- read.delim("./test/Inertial Signals/total_acc_z_test.txt", header = FALSE, sep = "")
colnames(total_acc_z_test) <- paste("total_acc_z", colnames(total_acc_z_test), sep = "_")
body_acc_z_test <- read.delim("./test/Inertial Signals/body_acc_z_test.txt", header = FALSE, sep = "")
colnames(body_acc_z_test) <- paste("body_acc_z", colnames(body_acc_z_test), sep = "_")
body_gyro_z_test <- read.delim("./test/Inertial Signals/body_gyro_z_test.txt", header = FALSE, sep = "")
colnames(body_gyro_z_test) <- paste("body_gyro_z", colnames(body_gyro_z_test), sep = "_")
test_dataset <- cbind(subject_test, y_test, x_test, body_acc_x_test, body_acc_y_test, body_acc_z_test, body_gyro_x_test, body_gyro_y_test, body_gyro_z_test, total_acc_x_test, total_acc_y_test, total_acc_z_test)

# merge the training and test data set's rows
merged_df <- rbind(training_dataset, test_dataset)



###########################################################################################
# Requirement #4: Step2: Appropriately label the dataset with descriptive variable names  #
#                 ======                                                                  #
###########################################################################################
# Fix the column names to avoid multiple columns being named the same. 
colnames(merged_df) <- make.names(colnames(merged_df), unique = TRUE)

# Load dplyr library
library(dplyr)
# Convert the merged data into a tibble.
merged_data <- tbl_df(merged_df)

#####################################################################################
# Requirement #2: Extract only the mean and standard deviation for each measurement #
#####################################################################################
# Select all Mean and Standard deviation columns
mean_and_std_columns <- select(merged_data, matches("mean|std", ignore.case = TRUE))

# Attach the subject and Activity columns
subject_activity_mean_and_std_columns <- cbind(rbind(subject_train, subject_test), rbind(y_train, y_test), mean_and_std_columns)

#########################################################################################
# Requirement #3: Use Descriptive activity names to name the activities in the data set #
#########################################################################################
# Convert the Activity column entries to use descriptive names
subject_activity_mean_and_std_columns$Activity <- activity_labels[match(subject_activity_mean_and_std_columns$Activity, activity_labels$Activity_Label), 2]

##############################################################################################################################
# Requirement #5: Create a second independent data set with the average of each variable for each activity and each subject. #
##############################################################################################################################
# Create a new data set by grouping on Activity and Subject.
tidy_data_set <- group_by(subject_activity_mean_and_std_columns, Activity, Subject)

# Get the mean value for each column on the grouped data.
tidy_data_set <- summarize_all(tidy_data_set, list(mean))

# Sort the data by Subject and Activity
tidy_data_set <- arrange(tidy_data_set, Subject, Activity)