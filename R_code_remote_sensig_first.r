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
colorRampPalette(c("magenta", "pink", "orange", "yellow")) (100)
cl3<- colorRampPalette(c("magenta", "pink", "orange", "yellow")) (100)
plot(p224r63_2011,col=cl3)
#lezione del 24/03/2020
library(raster)
setwd("C:/lab/")
p224r63_2011<-brick("p224r63_2011_masked.grd")
#per sapere tutte le informazioni riguardanti l'immagine si mette su una riga il nome del file, in questo caso: p224r63_2011 
# in particolare in Landsat si hanno le seguenti bande: 
# B1= blu
# B2= VERDE
# B3= rosso
# B4= infrarosso vicini (NIR)
# B5= infrarosso medio (MIR)
# B6= infrarosso termico (TIR)
# B7= altra banda per MIR
colorRampPalette(c("magenta", "pink", "orange", "yellow")) (100)
cl3<- colorRampPalette(c("magenta", "pink", "orange", "yellow")) (100)
plot(p224r63_2011,col=cl3)
#prima di plottare solo la banda del blu, per esempio, dobbiamo ripulire la grafica con "dev.off()"
# la banda del blu si chiama B1_sre come scritto nelle informazioni dell'immagine. 
# quindi dobbiamo legare la banda del blu (B1_sre) alla sua immagine (p224r63_2011) e in R questo lo faccio con il simbolo "$"
#ora possimao plottare l'mmagine legata alla banda che ci interessa. 
# detto ciò plotto la banda di interesse con colori che mi pare
colorRampPalette(c("light green", "green", "dark green", "blue", "dark blue", "light blue")) (300)
cl3<- colorRampPalette(c("light green", "green", "dark green", "blue", "dark blue", "light blue")) (300)
p224r63_2011<-brick("p224r63_2011_masked.grd")
# per plottare una sola banda:
plot(p224r63_2011$B1_sre,col=cl3)
# per fare un multiframe:
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
# ora plottimao le prime 4 bande di Landsat:
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre,col=cl3)
plot(p224r63_2011$B2_sre,col=cl3)
plot(p224r63_2011$B3_sre,col=cl3)
plot(p224r63_2011$B4_sre,col=cl3)
# se voglio fare un 2x2:
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre,col=cl3)
plot(p224r63_2011$B2_sre,col=cl3)
plot(p224r63_2011$B3_sre,col=cl3)
plot(p224r63_2011$B4_sre,col=cl3)
# ora facico una colorRampalette per ogi banda con i colori che voglio
par(mfrow=c(2,2))
clb<- colorRampPalette(c("blue", "dark blue", "light blue")) (300)
plot(p224r63_2011$B1_sre,col=clb)
clg<- colorRampPalette(c("light green", "green", "dark green")) (300)
plot(p224r63_2011$B2_sre,col=clg)
clr<- colorRampPalette(c("red", "dark red", "pink")) (300)
plot(p224r63_2011$B3_sre,col=clr)
clnir<- colorRampPalette(c( "pink", "orange", "yellow")) (300)
plot(p224r63_2011$B4_sre,col=clnir)





