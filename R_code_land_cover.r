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
#07/05/2021
#oggi classifichiamo una foresta in base al valore di riflettanza dei pixel
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")
#unsupervised classification, si chiama così perchè la classificazione la fa il sistema e noi non la supervisioniamo. 
# mentre nella supervised classification (supclass) sono io che scelgo il training site dove voglio scegliere i pixel campione sulla base dei quali campiono. 
# quindi la "unsuperClass" devo inserire l'immagine, il numero di campioni, il numero di classi, poi ci sono altri parametri che posos cambiare a piacere. 
#operiamo: gli argomenti sono l'immagine da classificare, il numeor di classi che voglio
di1 <- unsuperClass(defor1, nClasses=2)
di2 <- unsuperClass(defor2, nClasses=2)
par(mfrow=c(1,2))
plot(di1$map)
plot(di2$map)
#ora facciamo una classificazione con 3 classi
di3<- unsuperClass(defor2, nClasses=3)
plot(di3$map)
#ora andiamo a calcolare la frequenza dei pixel di una certa classe, quante volte ho pixel della classe di forseta, quante volte ho pixel di agricolo? queste sono frequenze
#la funzione che mi fa la frequenza è "freq" e l'argomento è la mappa che abbiamo generato
freq(di1$map)
#questi sono i valori ottenuti dalla statistica
#value  count
#[1,]     1  36202
#[2,]     2 305090
#ora calcoliamo la proporzione o la percentuale
tot1<- 36202+305090
prop1<- freq(di1$map)/tot1
#prop. agricoltura 1992= 0.1060734
# prop foresta 1993= 0.8939266
freq(di2$map)
#value      count
#[1,]     1 178730
#[2,]     2 163996
tot2<- 178730 + 163996
prop2<- freq(di2$map)/tot2
  value     count
#propo foresta 2006 0.521495
# prop  agricolura 2006 0.4785047
# ora facciamo una tabella riassuntva delle coperture (landcovers) dei due anni, in pratica costruiamo un data-fra
cover <- c("forest", "agriculture")
percent_1992<- c(89.39, 10.60)
percent_2006<-c(52.14, 47.85)
#dopo aver definiti i vettori della tabella, unsiamo la funzione data.frame per creare il dataframe
percentuali<- data.frame(cover, percent_1992, percent_2006)
percentuali
#ora costruiamo un grafico sulla base del dataframe appena costruito
#la funzione vuole il dataset su cui basarsi e le caratteristiche estetiche vche voglio nel mio grafico. 
ggplot(percentuali, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
ggplot(percentuali, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
#ora facciamo un plot di più grafici in una pagina, voliamo mettere insime i due grafici appena ftti
#come prima cosa associamo i plot a un nome
p1<-ggplot(percentuali, aes(x=cover, y=percent_1992, color=cover)) + geom_bar(stat="identity", fill="white")
p2<-ggplot(percentuali, aes(x=cover, y=percent_2006, color=cover)) + geom_bar(stat="identity", fill="white")
#poi uso grid.arrange
grid.arrange(p1, p2, nrow=1)



