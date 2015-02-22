# Returns a list functions that pertain to data in passed 'dirPath'
# writeTidyData() - a function that:
#   Merges the training and the test sets to create one data set.
#   Extracts only the measurements on the mean and standard deviation for each measurement. 
#   Uses descriptive activity names to name the activities in the data set
#   Appropriately labels the data set with descriptive variable names. 
#   Using the data set from previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#   A text file with passed 'fileName' filename will be created in the working directory
# getMergeData() - helps merge two datasets into one and returns the merged data
# Rest functions used in script are not exposed to user in this fashion
# Requires plyr package

require(plyr)

RunAnalysisHelper <- function(dirPath)
{  
  ## internal functions  
  # add the feature labels using featuredata - function not exposed to user
  addFeatureLabel <- function(data, featuresData) 
  {
    #using the getMergeData function add labels
    getMergeData(getMergeData(featuresData, c(562, "SubjectID")), c(563, "ActivityID"))[,2]
  }
  
  addDescriptiveActivityNames <- function(data, activityLabelsData)
  {
    data <- join(data, activityLabelsData, by = "ActivityID", match = "first")
    data <- data[,-1]
  }
  
  addDescriptiveVariableNames <- function(data)
  {
    # clean variable names
    names(data) <- gsub('\\(|\\)',"",names(data), perl = TRUE)
    names(data) <- make.names(names(data))
    
    # modify variable names to be more descriptive to the reader
    names(data) <- gsub('^t',"Time-",names(data))
    names(data) <- gsub('^f',"Frequency-",names(data))
    names(data) <- gsub('Freq\\.',"Freq-",names(data))
    names(data) <- gsub('Freq$',"Freq",names(data))
    
    data
  }
  
  ## exposed functions  
  # getMerge - helps merge two datasets into one and returns the merged data
  getMergeData <- function(dataset1, dataset2)
  {
    mergedData <- rbind(dataset1, dataset2)    
  }
  
  # calls other functions above and writes out a tidy data text file in working directory
  writeTidyData <-  function(fileName)
  {
    # intialize datasets        
    xTestData <- read.table(file.path(dirPath, "test/X_test.txt"))
    yTestData <- read.table(file.path(dirPath, "test/Y_test.txt"))
    xTrainData <- read.table(file.path(dirPath, "train/X_train.txt"))
    yTrainData <- read.table(file.path(dirPath, "train/Y_train.txt"))
    subjectTestData <- read.table(file.path(dirPath, "test/subject_test.txt"), header=F, col.names=c("SubjectID"))
    subjectTrainData <- read.table(file.path(dirPath, "train/subject_train.txt"), header=F, col.names=c("SubjectID"))
    activityLabelsData <- read.table(file.path(dirPath, "activity_labels.txt"), 
                                     col.names = c("ActivityID", "ActivityName"))    
    featuresData <- read.table(file.path(dirPath, "features.txt"), colClasses = c("character")) 
    
    # Merges the training and the test sets to create one data set.
    trainData <- cbind(cbind(xTrainData, subjectTrainData), yTrainData)
    testData <- cbind(cbind(xTestData, subjectTestData), yTestData)
    fullMergedData <- getMergeData(trainData, testData)
    
    # add feature labels 
    names(fullMergedData) <- addFeatureLabel(fullMergedData, featuresData)
    
    # extracts only the measurements on the mean and standard deviation for each measurement. 
    extracedData <- fullMergedData[,grepl("mean|std|SubjectID|ActivityID", names(fullMergedData))]
    
    # add descriptive activity names to name the activities in the data set
    extracedData = addDescriptiveActivityNames(extracedData, activityLabelsData)
    
    # appropriately labels the data set with descriptive variable names
    extracedData = addDescriptiveVariableNames(extracedData)
    
    # creates a second, independent tidy data set with the average of each variable for each activity and each subject
    secondTidyData = ddply(extracedData, c("SubjectID","ActivityName"), numcolwise(mean))
    write.table(secondTidyData, file = fileName)
  }
  
  list(getMergeData = getMergeData,writeTidyData = writeTidyData)
}