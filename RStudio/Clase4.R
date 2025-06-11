
library(dplyr)

library(descriptr)

library(ggplot2)

library(datos)

estatura <- c(175, 161, 170, 165, 170, 172, 153, 178, 178, 180)
estatura

length(estatura)

promedio <- sum(estatura)/(length(estatura)); promedio

cat("El promeido de las estaturas es: ", promedio)

est.ord <- sort(x = estatura, decreasing = FALSE); est.ord

length(est.ord)/2

mediana <- (est.ord[5] + est.ord[6])/2 ; mediana

#con datos impares

peso <- c(78.5, 69.4, 70.7, 69.9, 71.8)

peso.ord <- sort(peso, decreasing = FALSE)

length(peso)

promedio <- mean(estatura); promedio

mediana <-  median(estatura); mediana

median(peso)

moda <- ds_mode(estatura) # la moda del paquete descriptr

moda

library(modeest)

mlv(estatura, method = "mfv") # mejor metodo
?mlv

set.seed(348)

diamantes
print(diamantes, n = 1524)

diamantes <- diamantes
is.data.frame(diamantes)

str(diamantes)
names(diamantes)

View(diamantes)
?diamantes

datos.d <- sample_n(tbl = diamantes, size = 100, replace = FALSE)
View(datos.d)
attach(datos.d)

xbarra <- mean(precio)

min(precio)
max(precio)

diamantes[5,] # extrae la fila 5

datos.d[, 5] # estrae la columna 5

prom_quilate <-  mean(quilate); prom_quilate

# Rango = Dato mayor - dato menor

val_rango <- range(qulate, na.rm = FALSE); val_rango

# Varianza = medida de la variabilidad de los datos respecot a su media

 


# quiartiles

attach(datos.d)

Q1 <-  quantile(quilate, 0.25, type = 6); Q1
Q2 <-  quantile(quilate, 0.5, type = 6); Q2
Q3 <-  quantile(quilate, 0.75, type = 6); Q3

# rango intercuantilico q3 -q1

ri_quilate <- Q3 - Q1; ri_quilate

#limite superior Q3 + 1.5*RI
ls_quilate <- Q3 + 1.5 * ri_quilate; ls_quilate

#limite inferior 
li_quilate <- Q1 - 1.5 * ri_quilate; li_quilate

max(quilate)

caj <- boxplot(quilate, col = "lightblue", horizontal = TRUE, main = "diagrama de caja")
?boxplot