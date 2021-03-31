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
# ora facico una colorRampalette per ogni banda con i colori che voglio
par(mfrow=c(2,2))
clb<- colorRampPalette(c("blue", "dark blue", "light blue")) (300)
plot(p224r63_2011$B1_sre,col=clb)
clg<- colorRampPalette(c("light green", "green", "dark green")) (300)
plot(p224r63_2011$B2_sre,col=clg)
clr<- colorRampPalette(c("red", "dark red", "pink")) (300)
plot(p224r63_2011$B3_sre,col=clr)
clnir<- colorRampPalette(c( "pink", "orange", "yellow")) (300)
plot(p224r63_2011$B4_sre,col=clnir)

# 26/03/2021 --> plot in RGB
setwd("C:/lab/")
#funzione che va aprendere l'immagine dalla certella sul pc
library(raster)
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

#per fare plot RGB con funzione stretch:
plotRGB(p224r63_2011,r=3, g=2, b=1, stretch="lin")
# per usare anche l'infrarosso ho fatto slittare le bande, e ho inserito la 4 banda e tolto la prima, abbiamo montanto nel red l'infrarosso (4 banda)
plotRGB(p224r63_2011, r=4, g=2, b=1, stretch="lin")
# invertiamo la banda 4 con la 3:
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin")
# ora vediamo l'infrarosso nel posto del blu all'interno della funzione plotRGB
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")
#per fare il plot delle immagini che ho appena fatto
par(mfrow=c(2,2))
plot(plotRGB(p224r63_2011,r=3, g=2, b=1, stretch="lin"))
plot(plotRGB(p224r63_2011, r=4, g=2, b=1, stretch="lin"))
plot(plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin"))
plot(plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin"))
# per fare PDF di ciò che ho appena fatto
PDF(pdf_prova)
par(mfrow=c(2,2))
plotRGB(p224r63_2011,r=3, g=2, b=1, stretch="lin"))
plotRGB(p224r63_2011, r=4, g=2, b=1, stretch="lin"))
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="lin"))
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="lin"))
dev.off()

# ora vediamo l'immagine con uno stretch hist
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#par con colori naturali, colori falsi e colori falsi con histogram stretch
par(mfrow=c(3,1))
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="hist")

#31/03/2021
setwd("C:/lab/")
library(raster)
p224r63_1988<-brick("p224r63_1988_masked.grd")
p224r63_2011<-brick("p224r63_2011_masked.grd")
#oggi facciamo un set multitemporale con una stessa immagine, una dell'1988 e una del 2011
#si ricorda che la funzione "brick" importa un intero set di dati (di bande nel nostro caso) crando il blocco di raster tutti insieme
#ora plot dell'intera immagine '88: plottaggio di tutte le bande del satellite come abbiamo fatto per quella del  2011
plot(p224r63_1988)
#per colori naturali
plotRGB(p224r63_1988, r=3, g=2, b=1, stretch="lin")
#ora plottiamo in RGB utlizzando l'infrarosso
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="lin")
#multiframe di una stessa immagine, vista nel 1988 e nel 2011, montanta secondo schema RGB con infrarosso nella banda del rosso per osservarne la vegetazione
#sono stati fatti due plot per stessa immagine una con "hist" e una con "lin"
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011, r=4, g=2, b=1, stretch="lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=2, b=1, stretch="hist")
#per farne un pdf
pdf("il_mio_primo_pdf_con_R.pdf")
par(mfrow=c(2,2))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")
dev.off()
 







