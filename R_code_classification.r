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
