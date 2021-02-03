# Classify using the caret package!
library(caret)
# Check if trained model is available for classifcation!
if (exists("rf_model")) {
    final <- predict(rf_model, current_feature_stack, type = "raw")
    # Here we concert the factor results to integer values!
    imageMatrix <- matrix(as.integer(final), imageSizeX, imageSizeY)  #Create a image matrix
} else {
	 #Set matrix to NULL to avoid transfer to ImageJ
	imageMatrix<-NULL
    cat(paste("No trained model available! " ,sep="\n"))
}
