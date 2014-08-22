TidyDataProject
===============

run_analysis.R performs the following tasks:
----------------

  1. Read in the following files:
  
        * X_test.txt  
        * X_train.txt
        * y_test.txt
        * y_train.txt
        * subject_train.txt
        * features.txt
  2. Assign the descriptive column names to the test & train datasets
  3. Find the "mean()" & "std()" columns in features.txt
  4. Subset test & train to keep _only_ the "mean()" & "std()" columns
  5. Assign the descriptive activity names to the values in y_train & y_test
  6. Attach the activity & subject columns to their respective train & test sets using cbind
  7. Merge test & train data sets using rbind
  8. Calculate the average of each variable for each activity and each subject using agggreate with the mean function 
        
