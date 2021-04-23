R_code_classification.r


library(raster)
setwd("C:/lab/") 

#usiamo la funzione brick perchè è un immagine in RGB con più bande, e la associamo ad un nome
so<-brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
#per visualizzare l'immagine in RGB usiamo plot RGB: mettiamo il rosso nel primo livello, il verde nel secondo, il blu nel terzo e facciamo anche uno stretch lineare

plotRGB(so, 1, 2, 3, stretch=lin)
library(RStoolbox)
#classsificazione non supervisionata con unsuperClass, funzione di RStoolbox
soc <- unsuperClass(so, nClasses =3)
#per plottare solo la mappa dell'output fornito da unsuperClass, colleghiamo l'oggetto a "map"
plot(soc$map)
soc2 <- unsuperClass(so, nClasses =20)
soc2c<-colorRampPalette(c('yellow','red','black'))(100)
plot(soc2c)

#23/04/2021 GRAN CANYON
library(raster)
library(RStoolbox)
#stet della working directory
setwd("C:/lab/")
#usiamo brick perchè carichiamo un'immagine che è già un pacchetto di layer
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
#plotto l'immagine RGB montando gli strati come il rosso nel primo, il verde nel secondo, il blu nel terzo. 
#faccio lo stretch per visualizzare tutti i colori possibili (da 0 a 255 bit).
#posso  usare uno stretch lineare o uno stretch istogrammato che permetto una miglior risoluzione
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
# ora usiamo unsperClass: facciamo un modello di classificazione, quidni informazioni su classi e mappa
#noi siamo interessati alla mappa
gcc<- unsuperClass(gc, nClasses=2)

plot(gcc$map)
gcc4 <-unsuperClass(gc, nClasses=4)
plot(gcc4$map)
