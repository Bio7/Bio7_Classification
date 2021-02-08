# Using the caret package. Nice examples and for a reproducible model can be found here (CTRL+CLick to open link!):
# https://topepo.github.io/caret/
# https://zia207.github.io/geospatial-r-github.io/supervised-classification.html
# https://stackoverflow.com/questions/13403427/fully-reproducible-parallel-models-using-caret
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
