library(reshape2)

# 1.Load and merge data
testData <- read.table("./data/X_test.txt")
trainData <- read.table("./data/X_train.txt")
data <- rbind(testData,trainData)

# 2.Load and merge labels/activities
testAct <- read.table("./data/y_test.txt")
trainAct <- read.table("./data/y_train.txt")
mergedAct <- rbind(testAct,trainAct)
#names(labels) <- "activity"
activityNames <- read.table("./data/activity_labels.txt")
activity <- merge(mergedAct,activityNames,by="V1")
activity <- activity[,"V2"]

# 3.Load and merge subjects 
testSubject <- read.table("./data/subject_test.txt")
trainSubject <- read.table("./data/subject_train.txt")
subjects <- rbind(testSubject,trainSubject)
names(subjects) <- "subject"

# 4.subset data to relevant activities
features <- read.table("./data/features.txt")
means <- grep(glob2rx("*mean()*"),features$V2)  #where are variables containing "mean()"?
stds <- grep(glob2rx("*std()*"),features$V2)  #where are variables containing "std()"?
relFeatures <- append(means,stds)
data <- data[,relFeatures]

# 5.name variables
names(data) <- features[relFeatures,"V2"]

# 6.Add cols for subject and activity 
data <- cbind(subjects,activity,data)
dataSet <- data[order(data$subject),]
# -> LABELLED DATA SET

# 7. Create a second data set with the average of each variable for each activity and each subject.
dataMelt <- melt(dataSet, id = c("subject", "activity"))
dataFinal <- dcast(x, subject + activity ~ variable, mean)

## 8.Write data set to disk
write.table(dataFinal,file="CleanedDataSet.txt",sep=",",row.names=F, quote=F)