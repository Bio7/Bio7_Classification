# We use the lib package randomForest and split the data for
# predictions!  This could also be used to predict chunks of the data
# on a different server with Rserve instances, see:
# https://rdrr.io/cran/RSclient/man/Rclient.html!

library(randomForest)

# Check if trained model is available for classifcation!
if (exists("rf_model")) {
    splitrows <- NULL
    splits <- 8    
    # Adapted from:
    # https://stackoverflow.com/questions/45198194/partition-matrix-into-n-equally-sized-chunks-with-r
    split_data <- function(m, block.size, nb = ceiling(m/block.size)) {
        int <- m/nb
        upper <- round(1:nb * int)
        lower <- c(1, upper[-nb] + 1)
        size <- c(upper[1], diff(upper))
        split_rows <- cbind(lower, upper, size)
        assign("splitrows", split_rows, envir = .GlobalEnv)  #Create a global variable!
        
    }
    split_data(nrow(current_feature_stack), nb = splits)  #Here we using the number of splits!
    
    final <- NULL
    # Predict in a loop for all splits.
    for (x in 1:nrow(splitrows)) {
        lower <- splitrows[x, "lower"]
        upper <- splitrows[x, "upper"]
        tempvec <- predict(rf_model, current_feature_stack[lower:upper, 
            ])
        final <- c(final, tempvec)  # concatenate predictions in one vector!
    }
    
    # We convert the concatenate predictions (image) to a numeric matrix!
    imageMatrix <- matrix(as.integer(final), imageSizeX, imageSizeY)  #Create a image matrix
} else {
	 #Set matrix to NULL to avoid transfer to ImageJ
	 imageMatrix<-NULL
     cat(paste("No trained model available! " ,sep="\n"))
   
}
