## This first part looks for the data set to see if it already exists. 
## If the data set cannot be found it downloads the data set from the web.
## The file is then unzipped into the same directory.

if(!file.exists("UCI HAR Datset.zip")){
        dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(dataURL, destfile="UCI HAR Dataset.zip", mode="wb")
        unzip("UCI HAR Dataset.zip")
}

## This part reads and merges the training and test data sets into a single data set, 
## with training at the top followed by test data.

x.train <- read.table("./UCI HAR Dataset/train/X_train.txt")
x.test <- read.table("./UCI HAR Dataset/test/X_test.txt")
x.all <- rbind(x.train, x.test)

## This part reads and merges the subject identifier information for the data sets.

subject.train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject.test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
subject.all <- rbind(subject.train, subject.test)

## This part reads and merges the activity labels for the data sets.

y.train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y.test <- read.table("./UCI HAR Dataset/test/y_test.txt")
y.all <- rbind(y.train, y.test)

## This part reads in the names of the variables in the datasets from features.txt
## It then removes the first column so that only the names in column 2 are left.

features.full <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors=FALSE)
features <- features.full$V2

## This part selects only the means and standard deviations from the features list.
## It then uses the results to select the means and standard deviations from the main data set.

features.needed <- grep("-mean\\(\\)|-std\\(\\)",features)
x.mean.std <- x.all[, features.needed]

## This part attaches the names from features to the columns of the main data set.
## It also removes all parantheses and makes all names lower case for easier reading.

names(x.mean.std) <- features[features.needed]
names(x.mean.std) <- gsub("\\(|\\)", "", names(x.mean.std))
names(x.mean.std) <- tolower(names(x.mean.std))

## This part reads in the descriptive names of activities to the data set.
## Underscores are then replaced by spaces and names converted to lower case for easier reading.

activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
activities[, 2] <- gsub("_", " ", activities[, 2])
activities[, 2] <- tolower(activities[, 2])

## This part assigns the activity names to the activity labels in the data set.
## It then names the column of labels 'activity'.
## It also names the column for subjects in the subject data set 'subject'. 

y.all[, 1] = activities[y.all[,1], 2]
colnames(y.all) <- "activity"
colnames(subject.all) <- "subject"

## This part combines the data set with the activities and subjects lists. 
## It then writes the tidied data to a text file within the same directory as the original data.

tidy.data <- cbind(subject.all, y.all, x.mean.std)
write.table(tidy.data, "./UCI HAR Dataset/tidy-data.txt")

## This part creates a second tidy data set containing the averages of the mean and sd data.
## It then writes this second tidied data set to a text file within the same directory as the original data.

tidy.data.averages <- aggregate(x=tidy.data, by=list(activities=tidy.data$activity, subj=tidy.data$subject), FUN=mean)
tidy.data.averages <- tidy.data.averages[, !(colnames(tidy.data.averages) %in% c("subject", "activity"))]
write.table(tidy.data.averages, "./UCI HAR Dataset/tidy-data-averages.txt")