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
intsall.packages("rasterVis")
library(rasterVis)
# 09/04/2021
#oggi usiamo la funzione levelplot all'interno del pacchetto rasterVis
library(raster)
setwd("C:/lab/greenland")
levelplot(TGr)
#ora applichiamo levelplot a un singolo file di TGr
levelplot(TGr$lst_2000)
#ora cambiamo la coloRamPalette
cl<-colorRampPalette(c("blue", "light blue", "pink", "red")) (300)
#per cambiare la scala di colore con levelplot, bisogna usare l'argomento "col.regions")
levelplot(TGr, col.regions=cl)
#ora inseriamo il titolo totale dell'immagine e i nomi delle signole immagini
levelplot(TGr, col.regions=cl, main="LST variation time", names.attr=c("july2000","july2005", "july2010", "july2015"))
#ora giochiamo con immagini derivanti dal stellite nimbus_7, per osservare come si sono sciolti i ghiacci dal 1979 al 2007
# la immagini sono valori di microonde: il ghiccio riflette completamente le microonde mentre il resto no.
list.files(pattern="melt")
meltlist<-list.files(pattern="melt")
lapply(meltlist,raster)
melt_import<-lapply(meltlist,raster)
stack(melt_import)
melt<-stack(melt_import)
plot(melt)
levelplot(melt)
#differenza tra i valori di microornde tra le immagini del 1979 e de 2007: abbiamo applicato la matematica matriciale. 
melt_amount<-melt$X2007annual_melt - melt$X1979annual_melt
#poi cambiamo colore
clb<-colorRampePalette(c("blue", "white", "red")) (100)
plot(melt_amount, col=cld)
levelplot(melt_amount, col.regions=clb)


