### dati
ul <- c(0.935,0.877,0.321) #valori limite superiori
ll <- c(0.743,0.654,0.104) #valori limiti inferiori
ref <- c("AAA","BBB","CCC") #etichette che vorrei in ordinata 
m1 <- cbind(ul,ll)


### plot (aggiungo i label)
# genera il grafico ma senza asse y
plot(x = m1[,1], y = 1:3, xlab="Intervalli di confidenza", ylab="Aziende", 
     xlim = c(min(0),max(1)), type="n", yaxt="n")
segments(y0 = 1:3, x0 = m1[,1], y1 = 1:3, x1 = m1[,2], col = "red")
# aggiunge asse y specificando le label
axis(side = 2, at = 1:3, labels = ref)
# notare la differenza con il precedente
axis(side = 2, at = 1:3, labels = ref, las = 2)


### plot verticale
# genera il grafico invertendo x e y rispetto al precedente
plot(y = m1[,1], x = 1:3, ylab = "Intervalli di confidenza", xlab = "Aziende", 
     ylim = c(min(0),max(1)), type = "n", xaxt = "n")
segments(x0 = 1:3, y0 = m1[,1], x1 = 1:3, y1 = m1[,2], col = "red")
# aggiunge asse x specificando le label
axis(side = 1, at = 1:3, labels = ref)


### libreria plotrix (prevede una funzione per disegnare intervalli di confidenza)
# verifica se il package e' installato ed eventualmente installa
if(!"plotrix" %in% installed.packages()) {install.packages("plotrix")}
# carica il package
library(plotrix)
# creo vettore con i punti centrali
y <- apply(m1, 1, mean)
# creo vettore con le semidistanze dei segmenti (non indispensabile, potrei anche usare minimi e massimi)
err <- abs(apply(m1, 1, diff))/2
# disegno le barre
plotCI(1:length(y), y = y, uiw = err,
       xaxt="n", ylab="Intervalli di confidenza", xlab="Aziende", 
       ylim = c(min(0),max(1)), col = "red", pch=NA)
