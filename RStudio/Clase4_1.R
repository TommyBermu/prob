

#######################################################################

##### Estadistica Descriptiva Univariada Para Datos Cuantitativos #####

#######################################################################

library(ggplot2)

library(dplyr)

library(descriptr)

# Medidas de tendencia central 

# Media aritmética

"La media aritmetica es la suma de todos los datos sobre el numero de datos"

# Mediana

" El dato que se envcuentra en la mitad de un conjunto ordenado de datos"

# Moda

" El dato que mas se repite"

# Ejemplo con estaturas de un grupo de individuos

estatura <- c(175,161,170,165,170,172,153,178,178)



promedio <- sum(estatura)/length(estatura);promedio # Con fórmula

est.ord <- sort(x=estatura,decreasing = FALSE) # Ordenando los datos

est.ord

"(length(est.ord)/2+length((est.ord/2)+1))/2"

mediana <- (est.ord[4] + est.ord[5])/2; mediana

promedio <- mean(estatura);promedio # Función de R

mediana <- median(estatura) # Función de r

mediana

### Moda

moda <- ds_mode(estatura) # la moda del paqute descriptr

moda

library(modeest)

mlv(estatura, method = "mfv") # mejor método

#Media ,promedio, moda

library(datos)

diamantes <- diamantes

View(diamantes)

length(diamantes$precio)

set.seed(34)

datos.d <- sample_n(tbl=diamantes, size =100, replace = FALSE)

datos.d

length(datos.d$precio)

attach(datos.d) # guarda las variables de muestra1

#  Promedio Suma(de los datos)/ # de datos. El símbolo es xbarra

names(datos.d)

str(datos.d)

xbarra <- mean(datos.d$precio) # Promedio aritmetico

xbarra

min(precio) # el menor valor del precio de datos.d

max(precio) # el máximo valor del precio de datos.

diamantes[5,] # Extrae la fila 5 de la base de datos

datos.d[, 5]

# Promedio

# Base de datos muestra 1

prom_quilate <- mean(quilate); prom_quilate

cat("El promedio de quilate es", prom_quilate)

print("El promedio de quilate es: prom_quilate")

# Eh R la función que cakcula la mediana es median

mediana_quilate <- median(quilate); mediana_quilate

cat("La mediana de quilate es", mediana_quilate)

?descriptr

moda_quilate <- ds_mode(quilate); moda_quilate # del paquete descriptr

moda.quilate <- mlv(quilate,method="mfv") # esta es mejor

cat("La moda de quilate es", moda.quilate)

df1 <- matrix(c(prom_quilate,mediana_quilate,moda_quilate),nrow = 3);df1

rownames(df1) <- c("Promedio","Mediana","Moda")

colnames(df1) <- c("Quilate")

df1 <- data.frame(df1); df1

df2 <- data.frame(Quilate=df1$Quilate, Precio=c(mean(precio),median(precio),ds_mode(precio)))

row.names(df2) <- c("Promedio", "Mediana","Moda")
df2
# Mdidas de variabilidad

#* Rango
#* 
#* Varianza
#* 
#* Desviación estandar
#* 
#* Coeficiente de variación
#* 
####################

# Rango = Dato mayor - dato menor

rango <- range(quilate,na.rm = FALSE); rango

rango_quilate <- max(quilate) - min(quilate); rango_quilate

rango_quilate <- ds_range(quilate); rango_quilate #lo mismo que linea 96

cat("El rango de quilate es", rango_quilate)

# Varianza: medida de la variabilidad de los datos respecto a su media

# suma((xi-media)^2)/(n-1)

sum((quilate-mean(quilate))^2)/99  # APLICANDO LA FÓRMULA

# La funcion en r que calcula la varianza es var
varianza_quilate <- round(var(quilate),5); varianza_quilate

cat(' La varianza de quilate es:',varianza_quilate)

# Desviación estándar es la raiz cuadrada de la varianza y se simboliza S

#La función en r que calcula la desviación sd
desvest_quilate <- round(sd(quilate),5);desvest_quilate # la funcio es sd

cat('La desviacion estandar de quilate es:',sqrt(varianza_quilate))

## el coeficiente de variacion

#CV = (dedsv est/promedio)*100

(desvest_quilate/mean(quilate))*100

coefvar_quilate <- round(ds_cvar(quilate),3); coefvar_quilate

cat("El coeficiente de variación  de quilate es",coefvar_quilate,"%")

##############################################

############################

## Medidas de posición  en la librería moments ########


#Cuantiles

# En r se usa la función quantile
?quantile

q3_quilate <- quantile(x=quilate, probs = 0.75, type = 6); q3_quilate # percentil 75

cuartil_quilate <-  quantile(x = quilate,probs = c(0.25,0.5,0.75,1),type = 6);cuartil_quilate

cuartil <- c('25%','50%','75%','100%')

valor <- c(0.3925,0.7000,1.0875,3.4000)

tcuartil_quilate <- data.frame(cuartil,valor);tcuartil_quilate 

cat('Los cuartiles para la variable quilate son',cuartil_quilate)

# posición Pk = k*(n+1)/100

# Pecentil 75

75*(200+1)/100 # posicion del dato

sort(quilate)[150] # ordena y encuentra el dato en la posici?n 30

sort(quilate)[151]

sort(quilate)[150] + 0.75*(sort(quilate)[151]-sort(quilate)[150])


## A pedal

set.seed(1234)

datos.ej <- round(rnorm(5500,mean = 69,sd=5.7),3)

n <- length(datos.ej);n

datos.ej

datos.ej_ord <- sort(datos.ej)

# Pk = k-(n+1)/100

p75 <- 75*(n+1)/100 # la posicion

p75

terc_curtil <- datos.ej_ord[4125];terc_curtil

terc_curtil+0.75*(datos.ej_ord[4126]-datos.ej_ord[4125])

terc_curtil <- quantile(datos.ej,0.75,type = 6)

#Posicion del percentil 85

85*(200+1)/100

sort((quilate))[170]+0.85*(sort((quilate))[171]-sort((quilate))[170])

quantile(quilate,0.85,type = 6)


# Rango intercuartilico

# RI = Q3-Q1

ri_quilate <- quantile(quilate,0.75,type = 6)-quantile(quilate,0.25,type = 6);ri_quilate

li_quilate <- quantile(x = quilate,probs = 0.25,type = 6) - 1.5*(ri_quilate);li_quilate

ls_quilate <- quantile(x = quilate,probs = 0.75,type = 6) + 1.5*(ri_quilate);ls_quilate

# Cinco números: Q1,Q2,Q3, RI, Q1-1.5*RI, Q3+1.5*RI

?boxplot

cajbig_quilate <- boxplot(quilate,id=list(method="y"),col= "lightblue",horizontal = TRUE,
                          main="Diagrama de caja para quilate")

" Medidas de forma"

# Asimetria y curtosis

#https://www.probabilidadyestadistica.net/asimetria-y-curtosis/


"La asimetría y la curtosis son dos medidas estadísticas
que sirven para describir la forma de una distribución sin 
tener que hacer su representación gráfica. En concreto, 
la asimetría indica el grado de simetría (o asimetría) de 
una distribución, mientras que la curtosis indica el grado 
de concentración de una distribución alrededor de su media."

"la asimetría es un parámetro estadístico que sirve para 
determinar cuánto de simétrica (o asimétrica) es una 
distribución sin necesidad de representarla gráficamente."

library(moments)

"Paréntesis"

# Ejemplo para los datos de precio de diamantes en la muestra 

Q1_p <- quantile(x = datos.d$precio,probs = 0.25)

Q3_p <- quantile(x = datos.d$precio,probs = 0.75)

Q2_p <- median(datos.d$precio)

R.I_p <- Q3_p - Q1_p 

A_B <- (Q3_p +Q1_p -2*Q2_p )/R.I_p;A_B

A_P <- (mean(datos.d$precio)-mlv(datos.d$precio))/sd(datos.d$precio)

A_P

# La función en R para encontrar la asimetría se llama skewness

sesgo_precio <- skewness(datos.d$precio);sesgo_precio # de la libreria moments

sesgo_precio1 <- ds_skewness(datos.d$precio);sesgo_precio1 #de la libreria descriptr

hist(datos.d$precio)

plot(density(datos.d$precio))
# Curtosis

"La curtosis, también llamada apuntamiento, indica el grado 
de concentración de una distribución alrededor de su media.
Es decir, la curtosis muestra si una distribución es apuntada o achatada."

?kurtosis

k_precio <- kurtosis(datos.d$precio);k_precio  # del paquete moments

k_precio1 <- ds_kurtosis(datos.d$precio); k_precio1  # del paquete descriptr


#######  Resumen   ######

resumen_precio <- ds_summary_stats(datos.d,precio)

resumen <- ds_tidy_stats(datos.d)

resumen

View(resumen)

