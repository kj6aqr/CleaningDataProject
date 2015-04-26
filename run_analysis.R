print("Reading training set.")
training_set<-read.table("train/X_train.txt")
print("Reading test set.")
test_set<-read.table("test/X_test.txt")

print("Adding and filtering by category names.")
categories<-read.table("features.txt")
column_names<-categories[,2]
colnames(training_set)<-column_names
training_set<-training_set[,grep("mean|std",colnames(training_set))]
colnames(test_set)<-column_names
test_set<-test_set[,grep("mean|std",colnames(test_set))]

print("Adding activities.")
training_labels<-read.table("train/y_train.txt")
colnames(training_labels)<-"Activity"
training_set<-cbind(training_labels,training_set)
test_labels<-read.table("test/y_test.txt")
colnames(test_labels)<-"Activity"
test_set<-cbind(test_labels,test_set)

print("Adding subjects.")
subject_train <- read.table("train/subject_train.txt")
colnames(subject_train)<-"Subject"
training_set<-cbind(subject_train,training_set)
subject_test <- read.table("test/subject_test.txt")
colnames(subject_test)<-"Subject"
test_set<-cbind(subject_test,test_set)

print("Merging datasets.")
merged_set<-rbind(training_set,test_set)

print("Labeling activities.")
activities<-read.table("activity_labels.txt")
merged_set$Activity<-sapply(merged_set$Activity,function(x) x<-activities[x,2])

print("Generating summaries.")
summary_set<-aggregate(.~Subject+Activity,data=merged_set,FUN=mean)
write.table(summary_set,file="awhill_summary.txt",row.name=FALSE)