#R_code_knitr.r
setwd("C:/lab/")
#knitr, che va a prendersi un codice all’esterno e lo porta dentro R 
#dove genera un report che salverà dentro alla cartella dove abbiamo preso il codice. 
library(knitr)
stitch("R_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
