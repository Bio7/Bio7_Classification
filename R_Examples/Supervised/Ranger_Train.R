#Using the ranger package: 
library(ranger)
#Combine matrices which represent a special signature (class).
#Train with the selection matrices (layer=colors,features, etc.) combined in one matrix
dftrain<-NULL
#Here we combine all R-Shell view selections!
for (i in 1:length(.r_shell_vars)) {
	dftrain<-rbind(dftrain,get(.r_shell_vars[[i]]))
}
rf_model<-ranger(data = dftrain, dependent.variable.name = "Class",classification = TRUE,num.trees = 64)
print(rf_model)