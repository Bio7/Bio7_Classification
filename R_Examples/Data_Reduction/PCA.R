#PCA Analysis. 
#Just use the classification (4) action or simply execute this script
#with the feature stack!
#Use the second argument for the number of components!
pcaData <- prcomp(current_feature_stack,3)
print(summary(pcaData))
imageMatrix<-NULL
#Create an image from the first component!
#Use the Float transfer to transfer the image back!
#imageMatrix<-pcaData$x[,1];