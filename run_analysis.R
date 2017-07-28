getwd()

#setting waorking directory
setwd("C:/Users/Monika/Desktop/Cognizant/assignment")
#Reding Test File
XTest<-read.table("./UCI HAR Dataset/test/X_test.txt")
YTest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
SubjectTest<-read.table("./UCI HAR Dataset/test/subject_test.txt")
#Reading Train file
XTrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
YTrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
SubjectTrain<-read.table("./UCI HAR Dataset/train/subject_train.txt")
## Reading features and activity
features<-read.table("UCI HAR Dataset/features.txt")
activity<-read.table("UCI HAR Dataset/activity_labels.txt")
#Task 1 Merging Test and Train data using rbind
?rbind
X<-rbind(XTest,XTrain)
X
Y<-rbind(YTest,YTrain)
Y[1,]
Subject<-rbind(SubjectTest, SubjectTrain)
Subject
#Task 2 Extracts only the measurements on the mean and standard deviation for each measurement
?grep
#Using grepl find records matching mean and standard deviation in features file
index<-grep("mean\\(\\)|std\\(\\)",features[,2])
index
length(index)
#Extracting those records
X1<-X[,index]
# Task 3 Uses descriptive activity names to name the activities in the data set
Y[,1]<-activity[Y[,1],2] 
## replacing numeric values with lookup value from activity.txt; won't reorder Y set
head(Y) 
#Task 4 labeling
names<-features[index,2]
names(X1)<-names
X1
names(Subject)<-"SubjectID"
head(Subject)
names(Y)<-"Activity"
head(Y)
CleanedData<-cbind(Subject, Y, X1)
head(CleanedData[,c(1:6)])

#Task 5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
?rep
#Loading data.table package 
install.packages("data.table")
library("data.table")
CleanedData<-data.table(CleanedData)
# This is required as we have to find average of values and group by it 
TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity'] 
## features average by Subject and by activity
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)
#First 12 rows and 5 columns in Tidy dataset:

head(TidyData[order(SubjectID),c(1:4)],12)
