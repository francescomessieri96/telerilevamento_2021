#R_code_copernicus.r
#visualizzazione di dati cpernicus
#richimao tutte le librerie che servono
library(raster)
#install.packages("ncdf4")
setwd("C:/lab/")
library(ncdf4)
#dato che carico un solo layer uso la funzione raster non la funzione brick
NDVI<-raster("c_gls_NDVI_202006110000_GLOBE_PROBAV_V2.2.1.nc")
ext <- c(10, 11, 44, 45)
NDVIc <- crop(NDVI, ext)
plot(NDVIc)
LAI<-raster("c_gls_LAI_202004030000_GLOBE_PROBAV_V1.5.1.nc")
ext <- c(10, 11, 44, 45)
LAIc <- crop(LAI, ext)
cl<-colorRampPalette(c("green", "orange", "red"))(255)
plot(LAIc,col=cl)

#cambio la scala di colri
cl <-colorRampPalette(c("yellow", "green", "dark green"))(100)
plot(NDVI, col=cl)
#ricampioniamo l'immagine, resampling
NDVIres<-aggregate(NDVIc, fact=100)
plot(NDVIres, col=cl, main="NDVI maggio 2020")
#16/06/2021
setwd("C:/lab/")
library(raster)
install.packages("knitr")
install.packages("RStoolbox")
library(knitr)
library(RStoolbox)
#funzione stitch: utilizzando uno script di R, lo slaviamo in un qualsiasi software.
require (knitr)
