# Supervised Classification using the mlpack libary:
# Website: https://www.mlpack.org/
# Github: https://github.com/mlpack/mlpack
# R package: https://cran.r-project.org/web/packages/mlpack/index.html
# Website R Documentation: https://www.mlpack.org/doc/stable/r_documentation.html
# Hoover this editor links then STRG+Mouseclick to open the Links in the default Browser!

library(mlpack)

dftrain <- NULL
# Here we combine all R-Shell view selections!
for (i in 1:length(.r_shell_vars)) {
    dftrain <- rbind(dftrain, get(.r_shell_vars[[i]]))
}

# Extract the values
trainData <- dftrain[, -1]
# Extract the labels (classes)
labelForData <- as.matrix(dftrain[, 1])
# Train a random forest.
output <- random_forest(training = trainData, labels = labelForData, print_training_accuracy = TRUE, 
    num_trees = 50, minimum_leaf_size = 3, verbose = TRUE)
rf_model <- output$output_model
print(rf_model)
