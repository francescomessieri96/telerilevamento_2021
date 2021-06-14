#Rcode_NO2.r
setwd("C:/lab/")
library(raster)
EN01<-raster("EN_0001.png")
plotRGB(EN01, 1= "yellow", 2="purple", 3="black")
