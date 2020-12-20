# Using the caret package. Nice examples and for a reproducible model can be found here (CTRL+CLick to open link!):
# https://topepo.github.io/caret/
# https://zia207.github.io/geospatial-r-github.io/supervised-classification.html
# https://stackoverflow.com/questions/13403427/fully-reproducible-parallel-models-using-caret
library(caret)
library(doParallel)
library(kernlab) 
#Create a cluster!
mc <- makeCluster(detectCores())
registerDoParallel(mc)
# Combine matrices which represent a special signature (class). Train
# with the selection matrices (layer=colors,features, etc.) combined in
# one matrix
dftrain <- NULL
# Here we combine all R-Shell view selections!
for (i in 1:length(.r_shell_vars)) {
    dftrain <- rbind(dftrain, get(.r_shell_vars[[i]]))
}
#Control the computational nuances of the 'train' function
myControl <- trainControl(method = "cv", number = 3, repeats = 2, 
    returnResamp = "all", allowParallel = TRUE)
    
# Train a SVM model (non linear radial kernel function) 
# We convert the 'Class' column values to a factor for a classification!
# The other columns (denoted by the point) are used as the dependent
# data!
rf_model <- train(as.factor(Class) ~ ., data = dftrain, method = "svmRadial", 
    metric = "Accuracy", preProc = c("center", "scale"), trControl = myControl)

print(rf_model)

#Stop the cluster!
stopCluster(mc)
