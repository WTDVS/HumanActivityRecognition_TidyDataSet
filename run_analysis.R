# read plain text reference file for activity labels...

 activity_labels <- read.table("activity_labels.txt")

#  read the coded training labels and set as data frame...

y_train <- read.table("y_train.txt")
y_train_df <- as.data.frame(y_train)

y_test <- read.table("y_test.txt") 
y_test_df <- as.data.frame(y_test)

#  Add activity label to y_train data frame

for ( i in seq_len(nrow(y_train_df))) {    
    for ( j in 1:5 ) {  
        if ( y_train_df$V1[i] == as.character(activity_labels_df$V1[j]) ) 
            y_train_df$activity_label[i] <- as.character(activity_labels_df[j,2])  
    }
}

# Add activity label to y_test data frame 

for ( i in seq_len(nrow(y_test_df))) {    
    for ( j in 1:5 ) {  
        if ( y_test_df$V1[i] == as.character(activity_labels_df$V1[j]) ) 
            y_test_df$activity_label[i] <- as.character(activity_labels_df[j,2])  
    }
}

# Read in all Features as matrix 

t1 = read.table("features.txt")
t2 = as.matrix(t1)

# Build a vector to use for extracting only the mean and standard deviation measures...

mean_and_std_only <- subset(t2,grepl('mean()',t2[,2]) == TRUE | grepl('std()',t2[,2]) == TRUE )

# Read Training and Test measurement data sets 


train_x_dataset <- read.table("X_train.txt") 

test_x_dataset <- read.table("X_test.txt")



# Set Column names for Training and Test data sets 

colnames(train_x_dataset) <- c(t2[,2])

colnames(test_x_dataset) <- c(t2[,2])


# Assemble the training data set from components clean up names...

train_bind <- cbind(as.vector(trainSubject), y_train_df$activity_label)

colnames(train_bind)[1] <- "Subject"
colnames(train_bind)[2] <- "ActivityName"

train_bind <- cbind(train_bind, train_x_dataset)



# Similarly for the test data set... 

test_bind <- cbind(as.vector(testSubject), y_test_df$activity_label)

colnames(test_bind)[1] <- "Subject"
colnames(test_bind)[2] <- "ActivityName"

test_bind <- cbind(test_bind, test_x_dataset)


# Merge the test and training data sets 

 mergedTestAndTrainSet <- rbind(test_bind,train_bind)

# Extract Measurements only for the mean and standard Deviation for each measurement.
# Note: we add two to the index to account for the first two columns: subject and activity label...

newVal2 <- as.vector(c(1:100))

for ( i in seq_len(nrow(mean_and_std_only))) {    
         zval <- as.numeric(mean_and_std_only[,i]) + 2
    newVal[i] <-  mergedTestAndTrainSet[,zval] 
    print(newVal[i]
}


#  Calculate the average of each variable for each activity and each subject 




   Subject_Activity_Average <- aggregate(mergedTestAndTrainSet[,4] ~ Subject + ActivityName,mergedTestAndTrainSet,mean)

write.table(Subject_Activity_Average_New,file="SubjectActivityAverage.txt",row.name=FALSE)

