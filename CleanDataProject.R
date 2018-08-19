#load features text file
features <- read.delim("./UCI HAR Dataset/features.txt", sep="", header=FALSE)
#split features variable into 2 columns (sepeate the number from the actual variable)
#features <- strsplit(as.character(features, split= "", fixed= TRUE))
#load train group text file
traindata <- read.delim("./UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
#rename variable columns to features second column
colnames(traindata) <- features$V2
#load numeric value activity lables for train data
traindatalabels <- read.delim("./UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE)
#add a label column to train group file to identify activity by number
traindata$activity <- traindatalabels$V1
#load subjects text file for the train data
traindatasubjects <- read.delim("./UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
#add subjects column to train dataset
traindata$subjects <-  traindatasubjects$V1
#load test group text file
testdata <- read.delim("./UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
#rename variable columns to features second column
colnames(testdata) <- features$V2
#load numeric value activity lables for test data
testdatalabels <- read.delim("./UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE)
#add a label column to test group file to identify activity by number
testdata$activity <- testdatalabels$V1
#load subjects text file for the test data
testsubjects <- read.delim("./UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
#add subjects column to testdata set
testdata$subjects <- testsubjects$V1
#merge test and train data into one data frame
trainandtest <- rbind(traindata,testdata)
#rename numeric activity variables to descriptive values per info obtained from activity text file
trainandtest$activity[grep("1",trainandtest$activity)]<- "Walking"
trainandtest$activity[grep("2",trainandtest$activity)]<- "Walking Upstairs"
trainandtest$activity[grep("3",trainandtest$activity)]<- "Walking Downstairs"
trainandtest$activity[grep("4",trainandtest$activity)]<- "Sitting"
trainandtest$activity[grep("5",trainandtest$activity)]<- "Standing"
trainandtest$activity[grep("6",trainandtest$activity)]<- "Laying"
#change column names to descriptive names
colnames(trainandtest) <- gsub("Acc", "Acceleration", colnames(trainandtest))
colnames(trainandtest) <- gsub("Mag", "Magnitude", colnames(trainandtest))
colnames(trainandtest) <- gsub("^f", "Frequency", colnames(trainandtest))
colnames(trainandtest) <- gsub("^t", "Time", colnames(trainandtest))
colnames(trainandtest) <- gsub("Gyro", "Gyroscope", colnames(trainandtest))
#present data set as a data frame
trainandtest <- data.frame(trainandtest)
#load dplyr package
library(dplyr)
#create a tidy data set using dplyr
dtrainandtest <- tbl_df(trainandtest)
#select only the columns with mean and std(standard deviation)
meanstdtrainandtest <- dtrainandtest %>% select(matches("mean*|std*"), -matches("meanFreq*"),activity)
#data set with average of each variable by activity 
activityaverage <- meanstdtrainandtest %>% group_by(activity) %>% summarize_all(mean)
activityaverage <- data.frame(activityaverage)
