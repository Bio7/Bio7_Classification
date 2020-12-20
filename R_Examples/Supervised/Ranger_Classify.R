# Using the Ranger package!
library(ranger)

# Check if trained model is available for classifcation!
if (exists("rf_model")) {
    final <- predict(rf_model, current_feature_stack)
    imageMatrix <- matrix(as.integer(final$predictions), imageSizeX, imageSizeY)  #Create a image matrix
} else {
	 #Set matrix to NULL to avoid transfer to ImageJ
	 imageMatrix<-NULL
    cat(paste("No trained model available! " ,sep="\n"))
}
