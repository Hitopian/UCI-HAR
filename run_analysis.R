# --------------------------------------------------------------
# Coursera Data Science Specialization
# Peer-graded Assignment: Getting and Cleaning Data Course Project
#
# File:   run_analysis.R
# Author: Riccardo Piani (Hitopian)
# Date: 2020-03-05
#
# Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# --------------------------------------------------------------

rm(list = ls(all.names = TRUE))
cat("\014")

require(dplyr)

# Set here where you unzipped UCI-HAR data
setwd("F:/DATA/UCI HAR Dataset")

# ----------------------------------------------------------------
# 1. Merges the training and the test sets to create one data set.
# ----------------------------------------------------------------

# ----------F U N C T I O N ------------------------------
# input: type ("training"  or "test")
# output: tydy dataset with header
UCI_get_data <- function(type) {
  # load feature names
  tb_feature_names <- read.table("features.txt", col.names = c("id", "name"))
  # load data set
  tb_subjects <- read.table(file = paste("./", type, "/subject_", type, ".txt", sep = ""), col.names = c("subject_id"))
  tb_features <- read.table(file = paste("./", type, "/X_", type, ".txt", sep = ""), col.names = tb_feature_names$name)
  tb_labels <- read.table(file = paste("./", type, "/y_", type, ".txt", sep = ""), col.names = c("activity_id"))
  # cbind  subject id + features + activity id
  tb <- cbind(tb_subjects, tb_features, tb_labels)
}
# ------------------------------------------------------

# OUTPUT: tb1
# merged training and test data set
tb1 <- rbind(UCI_get_data("train")
             , UCI_get_data("test"))


t1 <- UCI_get_data("test")
                   
#-------------------------------------------------------------------------------------------
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#-------------------------------------------------------------------------------------------

# OUTPUT: tb2
# the searched string must have dots before and after
tb2 <-
  tb1 %>%
  select(subject_id
         , matches("\\.mean\\.|\\.std\\.")
         , activity_id)
#--------------------------------------------------------------------------
# 3. Uses descriptive activity names to name the activities in the data set
#--------------------------------------------------------------------------
tb_activity_names <- read.table("activity_labels.txt", col.names = c("id", "name"))

# OUTPUT: tb3
# new column "activity_name" 
tb3 <- merge(tb2
             , tb_activity_names
             , by.x = "activity_id"
             , by.y = "id"
             , all = TRUE) %>%
  rename(activity_name = name) %>%
  select(-activity_id) %>%
  arrange(subject_id) 

rm(tb_activity_names)
names(tb3)

#----------------------------------------------------------------------
# 4. Appropriately labels the data set with descriptive variable names.
#----------------------------------------------------------------------
# Adopting the following rename rules:
# t --> time
# f --> freq
# dots --> get rid of 
# time/freq, Body/Gravity, Acc/Gyro, Jerk, Mag, mean/std, X/Y/Z 
#   --> keep sequence, terms separated by "_", all lowercase
# exception case --> clean "_body_body" replacing it with "_body"
columnNames <- names(tb3)
termNames <- c("Body", "Gravity", "Acc", "Gyro", "Jerk", "Mag", "mean", "std", "X", "Y", "Z" )
# t --> time
columnNames_new <-  gsub("^t","time",columnNames)
# f --> freq
columnNames_new <-  gsub("^f","freq",columnNames_new)
# get rid of dots
columnNames_new <-  gsub("\\.","",columnNames_new)
# terms separated by "_"
for(i in termNames) {
  columnNames_new <- gsub(i, paste("_", i, sep = ""), columnNames_new)  
}
columnNames_new <- tolower(columnNames_new)
# "_body_body" replaced by "_body"
columnNames_new <-  gsub("_body_body","_body",columnNames_new)

# OUTPUT: tb4
tb4 <- tb3
names(tb4) <- columnNames_new

# ----------------------------------------------------------------------------------
# 5. From the data set in step 4, creates a second, independent tidy data set with 
# the average of each variable for each activity and each subject.
# ----------------------------------------------------------------------------------
# No NAs in the table
sum(is.na(tb4))

# OUTPUT: tb5 + tb_final.txt 
tb5 <- 
  tb4 %>%
  group_by(subject_id, activity_name) %>%
  summarise_all(mean)

write.table(tb5, "tb_final.txt", row.name = FALSE)






