setwd("C:/lab/")
library(raster)
library(RStoolbox)
#install.packages("ggplot2")
library(ggplot2)
defor1<-brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
defor1gg<-ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
#per fare un par non funziona la funzione par(mfrow), ma ci vuole una funzione specifica per ggRGB
#ci serve il pacchetto gridextra
install.packages("gridExtra")
#multiframe con ggplot2 e gridExtra
defor2<-brick("defor2.jpg")
defor2gg<-ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
#grid.arrange permette di fare un multiframe con immagini plottate con ggplo2
grid.arrange (defor1gg, defor2gg, nrow=2)
