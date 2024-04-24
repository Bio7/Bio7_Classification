#DBSCAN Classification. 
#Just use the classification (4) action or simply execute this script
#with the feature stack!
#Slow for image data. Takes some time for larger images!
library("dbscan")
kl <- dbscan(current_feature_stack, eps = 3, minPts = 100)
imageMatrix<-matrix(as.double(kl$cluster),imageSizeX,imageSizeY)#convert to a matrix (width of image, height of image)
