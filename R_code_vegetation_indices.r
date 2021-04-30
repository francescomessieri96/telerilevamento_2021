#R_code_vegetation_indices.r
setwd("C:/lab/")
library(raster)
library(RSToolbox)
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#30/04/2021
# oggi calcoliamo gli indiic vegetazionali, in particolare NDVI
setwd("C:/lab/")
library(raster)
# carichimao le immagini che sono già montate in RGB
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#plottiamo le due immagini in RGB montando l'infrarosso sul rosso
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")
#ora faccciamo il primo indice vegetazionale (DVI)
#prima di tutto andiamo a vedere le informazioni dei file su R.
#dobbiamo unire il dataset defor1 con il nome della banda defor1.1 meno il nome della banda defor2.2
dvi1<- defor1$defor1.1 - defor1.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl, main="DVI at time 1")
# faciamo la stessa cosa con la seconda immagine
dvi2 <- defor2$defor2.1 - defor2$defor2.2
cl2 <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi2, col=cl2, main = "DVI at time 2")
#confrontiamo le due immagini
par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl2, main = "DVI at time 2")
#ora osserviamo come nella stessa area sia cambiata l'uso del suolo: la mappa che otterremo avrà nelle zone rosse la più grande differenza di vegetazione, per cambio di utilizzo del suolo
difdvi <- dvi1 - dvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)
# ora facciamo l'NDVI standardizziamo le riflettanze che è una normalizzazione del DVI ottenuto con la somma a denominatore. 
# NDVI è cnfrontabile qualunque siano i bit dell'immaigne, poichè è sempre un valore compreso tra -1 e 1
# NDVI = (NIR - RED )/ (NIR + RED)
ndvi1 <- (dvi1) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl, main= "NDVI at time 1") 
#ora calcolo NDVI per il secondo momento
ndvi2 <- (dvi2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl, main= "NDVI at time 2")
#ora usiamo la funzione spectralinces del pachetto RSToolbox per calcoraew tutti gli indici che propone la funzione in un colpo solo
vi <- spectralIndices(defor1, green = 3, red = 2, nir = 1)
plot(vi, col=cl)




