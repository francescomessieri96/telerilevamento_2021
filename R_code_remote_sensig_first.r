# My first code in R for remote sensig!!!
# il mio primo codice in R per il telerilevamento!!
# install.packages("raster")
setwd("C:/lab/")
#funzione che va aprendere l'immagine dalla certella sul pc
library(raster)
#funzione "library" mermette di utilizzare il paccchetto che c'è nelle parentesi della funzione, senza virgolette perchè il pacchetto è già stato scaricato in R
p224r63_2011<-brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
#colour change
colorRampPalette(c("black", "grey","light gray")) (100)
cl<- colorRampPalette(c("black", "grey","light gray")) (100)
plot(p224r63_2011,col=cl)
# colour change 2 
colorRampPalette(c("blue", "light blue","dark blue", "magenta", "pink", "orange", "yellow")) (1000000)
cl2<-colorRampPalette(c("blue", "light blue","dark blue", "magenta", "pink", "orange", "yellow")) (1000000)
plot(p224r63_2011,col=cl2)
# colour change 3 
colorRampPalette(c("magenta", "pink", "orange", "yellow")) (1000000)
cl3<- colorRampPalette(c("magenta", "pink", "orange", "yellow")) (1000000)
plot(p224r63_2011,col=cl3)
