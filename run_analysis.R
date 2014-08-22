#Read in all of the necessary files
test <- read.table("test/X_test.txt", sep="")
train <- read.table("train/X_train.txt", sep="")
test_activity <- read.table("test/y_test.txt", col.names = "activity", sep="")
train_activity <- read.table("train/y_train.txt", col.names = "activity", sep="")
subject_test <- read.table("test/subject_test.txt", col.names = "subject", sep="")
subject_train <- read.table("train/subject_train.txt", col.names = "subject", sep="")
features <- read.table("features.txt", sep="")

#Search for the columns with the string "mean()" & "std()"
meanCols <- grep("mean()", features[,2])
stdCols <- grep("std()", features[,2])

#Get the column names from feautures & assign them to the datasets 
colNames <- features[,2]
test <- setNames(test, colNames)
train <- setNames(train, colNames)

#Subset the data so that only MEAN & STD columns remain
test <- test[ ,c(meanCols,stdCols)]
train <- train[ ,c(meanCols,stdCols)]

#loop over the activity column to replace the activity number with the appropriate activity name
for (i in seq_along(train[,1])){
	if (train_activity$activity[i] == 1){
		train_activity$activity[i] <- "WALKING"
	} else if (train_activity$activity[i] == 2){ 
		train_activity$activity[i] <- "WALKING_UPSTAIRS"
		}
		else if (train_activity$activity[i] == 3){ 
		train_activity$activity[i] <- "WALKING_DOWNSTAIRS"
		}
		else if (train_activity$activity[i] == 4){ 
		train_activity$activity[i] <- "SITTING"
		}
		else if (train_activity$activity[i] == 5){ 
		train_activity$activity[i] <- "STANDING"
		}
		else { 
		train_activity$activity[i] <- "LAYING"
		}
	}
	
for (i in seq_along(test[,1])){
	if (test_activity$activity[i] == 1){
		test_activity$activity[i] <- "WALKING"
	} else if (test_activity$activity[i] == 2){ 
		test_activity$activity[i] <- "WALKING_UPSTAIRS"
		}
		else if (test_activity$activity[i] == 3){ 
		test_activity$activity[i] <- "WALKING_DOWNSTAIRS"
		}
		else if (test_activity$activity[i] == 4){ 
		test_activity$activity[i] <- "SITTING"
		}
		else if (test_activity$activity[i] == 5){ 
		test_activity$activity[i] <- "STANDING"
		}
		else { 
		test_activity$activity[i] <- "LAYING"
		}
	}	
	
#attach the columns to their respective data sets	
train <- cbind(subject_train, train_activity, train)
test <- cbind(subject_test, test_activity, test)

#combine the training & test data sets 	
complete_data <- rbind(test,train)

#get the mean of each column for each activity & each subject
averages <- aggregate(complete_data[,3:81], by=list(subject = complete_data$subject, activity = complete_data$activity), mean)

