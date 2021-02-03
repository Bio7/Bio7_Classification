# We use the lib package randomForest
library(randomForest)
library(caret)

#Train with the selection matrices (layer=colors,features, etc.) combined in one matrix
dftrain<-NULL
#Here we combine all R-Shell view selections!
for (i in 1:length(.r_shell_vars)) {
	dftrain<-rbind(dftrain,get(.r_shell_vars[[i]]))
}

####Split the data into training data and test data:
inTrain<- createDataPartition(y=dftrain[,1], p=0.5, list=FALSE)
trainingSub<- dftrain[inTrain,]
testDataSub<- dftrain[-inTrain,]
rf_model<-randomForest(as.factor(Class)~.,data=trainingSub,ntree=64)
final<-predict(rf_model,testDataSub)
####Print the confusion matrix.
print(confusionMatrix(final, as.factor(testDataSub[,1])))