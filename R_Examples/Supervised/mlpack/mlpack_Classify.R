# Supervised Classification using the mlpack libary:
# Website: https://www.mlpack.org/
# Github: https://github.com/mlpack/mlpack
# R package: https://cran.r-project.org/web/packages/mlpack/index.html
# Website R Documentation: https://www.mlpack.org/doc/stable/r_documentation.html
# Hoover this editor links then STRG+Mouseclick to open the Links in the default Browser!
library(mlpack)

if (exists("rf_model")) {
    final <- random_forest(input_model = rf_model, test = current_feature_stack, 
        verbose = TRUE)
    # Here we concert the factor results to integer values!
    imageMatrix <- matrix(as.integer(final$predictions), imageSizeX, imageSizeY)  #Create a image matrix
} else {
    # Set matrix to NULL to avoid transfer to ImageJ
    imageMatrix <- NULL
    cat(paste("No trained model available! ", sep = "\n"))
}
