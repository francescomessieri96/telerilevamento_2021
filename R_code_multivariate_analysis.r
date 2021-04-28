#R_code_multivariate_analysis
library(raster)
library(RStoolbox)

 

 setwd("C:/lab/") 
 #andiamo ad importare le immagini usando la funzione brick poichè abbiamo tante bande: set multiplo di dati
 p224r63_2011 <- brick("p224r63_2011_masked.grd")
 #ora plottiamo i valori dei pixel della B1 contro qelli della B2 dell'immagine appena caricata.
 #osserviamo una correlazione tra l'aumento del valore di riflettanza per i pixel della banda 1 e l'aumento di riflettanza per i pixel della banda 2. 
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
pairs(p224r63_2011). 


#28/04/2021
library(raster)
library(RStoolbox)
setwd("C:/lab/") 
p224r63_2011 <- brick("p224r63_2011_masked.grd")
p224r63_2011
#per vedere la correlazione che c'è tra le bande prese a due a due, usiamo la funzione pairs
pairs(p224r63_2011)
# per fare una PCA aggreghiamo prima i pixel con "aggregate": nome dell'immagine e fattore di campionamento (quante volte vogliamo aumentare la grandezza del pixel)
aggregate(p224r63_2011, fact=10)
#quindi abbiamo fatto un ricampionamento dell'oggetto, in particolare abbiamo fatto un ricampionamneto lineare di tutte le bande presnti nell'oggetto. 
p224r63_2011res<-aggregate(p224r63_2011, fact=10)
#ora facciamo un plot
par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch ="lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch ="lin")
#ora facciamo una PCA con la funzione rasterPCA, che fa parte del pacchetto RSToolbox
p224r63_2011res_pca<-rasterPCA(p224r63_2011res)
#andiamo a vedere cosa ci spiega l'oggetto appena creato con la PCA.
summary(p224r63_2011res_pca$model)
plotRGB(p224r63_2011res_pca$map, r=1, g=2, b=3, stretch="lin")
