19/05/21
#R_code_variability
library(RStoolbox)
library(raster)
setwd("C:/lab/")
#importiamo l'immagine del similaun: immagine sentinel
sent<-brick("sentinel_similaun.png")
#plotiamo l'immagine in RGB, inserendo il NIR nel red, il red nel canale del green, il green nel canale del blu.
plotRGB(sent, stretch="lin")
#ora usiamo la moving window
#prima di tutto importo il layer di interesse che nel mio caso è un NDVI di un campo di mio nonno
NDVI<- raster("NDVI_28-04-21_bonf_patate_riproiettato.tif")
plot(NDVI)
#ora usimao la funzione focal che ci calcola la statistica che vogliamo con la mooving window
# funzione focal: argomento, w=....: devo dire che tipo di finestra mobile voglio. 
NDVIsd<-focal(NDVI, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(NDVIsd)
#cambio la color rampe
clsd<- colorRampPalette(c("magenta", "yellow", "green"))(100)
plot(NDVI,col=clsd)
#ora voglio fare la media dell'NDVI, media di 3x3 pixel 
NDVIm<- focal(NDVI, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
plot(NDVIm)
#ora se voglio fare una finestra mobile di più grande
NDVIm2<- focal(NDVI, w=matrix(1/225, nrow=15, ncol=15), fun=mean)
plot(NDVIm2)
#importo un altra immagine di NDVI per un latra data, dello stesso appezzamento di terreno. 
raster("NDVI_ritagliato_3-05-2021.tif")
NDVI_3_05<-raster("NDVI_ritagliato_3-05-2021.tif")
plot(NDVI_3_05)
#ora applichiamo la finestra mobile su una PC1, dopo aver fatto un analisi multivariata. 
#usiamo quindi RStoolbox, in particolare rasterPCA
sentpca<- rasterPCA(sent)
plot(sentpca$map)
