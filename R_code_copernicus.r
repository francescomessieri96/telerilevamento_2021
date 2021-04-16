#R_code_copernicus.r
#visualizzazione di dati cpernicus
#richimao tutte le librerie che servono
library(raster)
#install.packages("ncdf4")
setwd("C:/lab/")
#dato che carico un solo layer uso la funzione raster non la funzione brick
NDVI<-raster("c_gls_NDVI_202005210000_GLOBE_PROBAV_V3.0.1.nc")
#cambio la scala di colri
cl <-colorRampPalette(c("yellow", "green", "dark green"))(100)
plot(NDVI, col=cl)
#ricampioniamo l'immagine, resampling
NDVIres<-aggregate(NDVI, fact=100)
plot(NDVIres, col=cl, main="NDVI maggio 2020")
