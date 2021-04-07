# Time series analysis
# Greenland increase of temperature
# Data and code from Emanuela Cosma
#install.packages("raster")
library(raster)
setwd("C:/lab/greenland")
#per importare l'immagine che ci serve con la funzione raster
lst_2000<-raster("lst_2000.tif")
lst_2005<-raster("lst_2005.tif")
lst_2010<-raster("lst_2010.tif")
lst_2015<-raster("lst_2015.tif")
#per fare un multipanel
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
#ora dobbiamo importare le immagini in un colpo solo
# list.files permette di fare una lista di file che hanno uno elemento in comune (pattern)
list.files(pattern="lst")
#chimamiamo la lista con un nome a noi comodo
rlist<-list.files(pattern="lst")
# la funzione lapply permette di importare la lista appena fatta con "raster"
lapply(rlist,raster)
#chiamiamo la lista con un nome che ci piace
import<-lapply(rlist,raster)
# "stack" permette di 
stack(import)
TGr<-stack(import)
plot(TGr)
# immagine in RGB montanta mettendo per ogni colore un immagine lst di un diverso anno
plotRGB(TGr, 1, 2, 3, stretch= "lin")
