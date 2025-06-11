
###########################################

## Gráficas datos cuantitativos continuos

###########################################

# Box plot
# tallo y hojas
# de dipersiion
# histogramas

library(dplyr)

library(descriptr)

library(ggplot2)

library(datos)


pesos <-  c(46.6,39.1,45.2, 52.5, 53.8, 56.1, 57.1, 58.2, 60.3, 65.4, 65.3, 66.9, 75.1, 
            53.8, 55.7, 55.6, 58.1, 64.4, 65.4, 66.2, 67.5, 64.8, 68.9, 69.7,
            74.2,74.1,74.3,75.6,75.5,78.4, 83.2,80.4,90.3, 122.3,92,121.3,94.1,112.4,79.2,79.2,82.1,100.3,121.2,107.5);pesos

length(pesos)

pesos1 <- round(pesos/10, 1);
pesos1

min(pesos)

max(pesos)

?stem

stem(pesos, scale = 1, width = 40) # Tallo y hojas
stem(pesos1, scale = 1, width = 40)

# si inclinamos la cabeza, se ve como una campana... :D

mean(pesos1) # media
median(pesos1) #mediana

Notas <-  c(15, 45,22,23,31,30,34, 47,53, 58, 58, 60, 62, 67, 74, 75, 78, 80, 80, 81, 85, 85, 85, 90, 92)

length(Notas)

stem(Notas, scale = 2, width = 40)

" pendiente "

# Caja y bigotes

?boxplot

names(datos.m)

attach(datos.m)

boxplot(x = edad, main="Diagrama de cajas para x de datos.m",
        ylab=" ", col="cadetblue", horizontal = TRUE)


boxplot(edad~raza, main="Boxplot para la edad",
        col="cadetblue2", horizontal = TRUE)

?boxplot

View(pinguinos)

?pinguinos

?penguins

is.data.frame(pinguinos)

mean(pinguinos$largo_pico_mm)

?mean

mean(pinguinos$largo_pico_mm, na.rm = TRUE) # quitar el NA del print

pinguinos1<- na.omit(pinguinos)  ## elimino los valores ausentes de la base de datos

mean(pinguinos1$largo_pico_mm)

names(pinguinos1)

attach(pinguinos1) 

# Digramas de dispersion

# Gráfica de dispersión de la longitud del pico  en función de la masa corporal

plot(masa_corporal_g, largo_pico_mm, 
     main = "Gráfica de Dispersión: Masa Corporal vs. Longitud del Pico",
     xlab = "Masa Corporal (g)",
     ylab = "Longitud del Pico (mm)",
     pch = 16,  # Tipo de punto
     col = especie,
     title = "Especies")  # Color según la especie de pingüino

legend("bottomright",
       legend = levels(especie), 
       col = 1:3, 
       pch = 16, 
       title = "Especies",
       cex=0.5)            # tamaño de la leyenda

library(fdth)

?fdth

attach(pinguinos1)
?detach

# tabla de frecuencias

tabla1 <- fdt(x =largo_pico_mm,k =8)
?fdt

tabla1

plot(tabla1, col="cadetblue",type = "fh", main = "Histograma del pico con fdt")

menor_pico <- min(pinguinos1$largo_pico_mm)

mayor_pico <- max(pinguinos1$largo_pico_mm)

num_int <- 1 + 3.33*log10(length(pinguinos1$largo_pico_mm))  # numero de intervalos
num_int

anc_pico <- (mayor_pico -menor_pico)/num_int  # ancho de clase

anc_pico

# con el paquete descriptr

ds_plot_bar(pinguinos1,especie, fill = "cadetblue2")

ds_plot_histogram(pinguinos1, largo_pico_mm, fill='cadetblue',bins = 6)

# basico

hist(largo_pico_mm,breaks = "sturges", main = 'Histograma de Profundidad',col='cadetblue')
?hist

hist(largo_aleta_mm, breaks=5, xlab="Figura 1: Histograma de aleta")

library(moments)

moments::kurtosis(x=datos.p$Ingreso_Mensual)

library(descriptr)

ds_kurtosis(x=datos.p$Ingreso_Mensual)

e1071::kurtosis(datos.p$Ingreso_Mensual, type = 1)

e1071::kurtosis(datos.p$Ingreso_Mensual, type = 2)

e1071::kurtosis(datos.p$Ingreso_Mensual, type = 3)