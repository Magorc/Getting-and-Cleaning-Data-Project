## Assuming users have downloaded the data and did
## not rename the folder, this makes a list of all
## the files in the UCI HAR Dataset
path_rf <- file.path("UCI_HAR_Dataset")
files<-list.files(path_rf, recursive=TRUE)
files #prints the list of files

## Build the data set by merging, then merging 
## the merges, and so on.  Like a quilt!

## First, load all the pieces:
dataActivityTest  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)
dataSubjectTrain <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)
dataSubjectTest  <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

## Now to stitch it all together:
#Get all the data together:
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

#get the variable/column names together:
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_rf, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

#Now kiss!
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine) #Our raw data, all in one place!

## Take away all the columns we don't want to mess with. In this case
## I want all columns that have "mean()" and "std()" at the end of the 
## names.

#grep helps us get the list of the columns we want:
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

# using that list, we subset Data to give us only the stuff we want. We also
# replace the raw data with this data.
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

## Make sure the activity names are descriptive and not just the ID numbers
## assigned to them

# get the labels and IDs from the txt file
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
# do a "find and replace" via factor()
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])

## Now we make the rest of the columns more human readable.  I do this mostly 
## by transforming the abbreviations to the full words. Any further interpretation
## is a risk of being inaccurate.

# Our friend of a friend: gsub
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

## Make the tidy data set that is described in the assignmentt

library(plyr); # gotta have it!
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)
