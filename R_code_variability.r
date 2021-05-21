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

21/05/21
library(RStoolbox)
library(raster)
#per fare plot
library(ggplot2)
#per plottare insisme tanti plot ottenuti con ggplot
library(gridExtra)
#viridis serve per colorare i plot di ggplot in modo automatico
install.packages("viridis")
library(viridis)
setwd("C:/lab/")
#carichiamo l'immagine
sent<-brick("sentinel_similau.png")
#faccio la pca dell'immagine
sentpca<- rasterPCA(sent)
#plotto le immagini della pca
plot(sentpca$map)
#ora vogliio fare la deviazione standard di uno strato, per esmepio la pc1
#prima di tutto chiamo l'oggetto di cui voglio fare da deviaizone standard con la finestra mobile, cioè pc1
pc1<- sentpca$map$PC1
pc1sd<- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd<- colorRampPalette(c("blue", "green", "pink", "magenta", "orange"))(100)
plot(pc1sd, col=clsd)
#utlizziamo ggplot
ggplot()
geom_raster(pc1sd, mapping=aes(x=x, y=y, fill=pc1sd))




