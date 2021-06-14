#Rcode_NO2.r
setwd("C:/lab/")
library(raster)
library(RStoolbox)
library(rasterdiv)
EN01<-raster("EN_0001.png")
cls<- colorRampPalette(c("orange", "magenta", "purple", "black"))(200)
plot(EN01, col=cls)
EN13<- raster("EN_0013.png")
plot(EN13, col=cls)
#dopo aver caricato le  imamgini di gennaio e di marzo per quanto riguarda gli NO2, andiamo a calcolare una differenza tra le due immagini
ENdif<- EN01-EN13
plot(ENdif, col=cls)
#ora plottiamo tutte e tre le immagini
par(mfrow=c(1,3))
plot(EN01, col=cls)
plot(EN13, col=cls)
plot(ENdif, col=cls)
#per importare tutte le bande tutte insieme
rlist<-list.files(pattern="EN")
#dobbiamo applicare la funzione raster ad gni immagine della lista appena creata
import<- lapply(rlist,raster)
#ora con la funzione stack impacchettiamo le 13 immagini che abbiamo appena creato 
EN<- stack(import)
plot(EN, col=cls)
#ora andiamo a fare un'analisi multivariata delle 13 immagini appena caricate
ENpca<- rasterPCA(EN)
summary(ENpca$model)
dev.off()
plotRGB(ENpca, r=1, g=2, b=3, stretch="hist")
