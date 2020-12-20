#KMeans Classification. 
#Just use the classification (4) action or simply execute this script
#with the feature stack!
#Use the second argument for the number of clusters!
kl <- kmeans(current_feature_stack, 6)
imageMatrix<-matrix(as.double(kl$cluster),imageSizeX,imageSizeY)#convert to a matrix (width of image, height of image)