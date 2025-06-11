#esto es un comentario 

hipotenusa <- sqrt(3^2 + 4^2) #asignaciones
imc <- 55/(1.73**2) 

#fahrenheit a celcius
celcius <- 30
fahrenheit <- celcius*9/5 + 32
fahrenheit

#tipos de datos

#numericos (números xd)
decimal <- 2.3985
ceiling(decimal)
floor(decimal)
trunc(decimal) #elimina la parte decimal del número

#string (texto)
palabra <- "esto es una cadena"

#logicos (boleano)
bonito <- FALSE
plata <- FALSE
carisma <- FALSE
atractivo <- bonito && plata && carisma
atractivo

"los tres anteriores pues son los comunes"

#vectores (como los arreglos en java)
c <- c(1, 2, 3, 4, 5, 6)
c

c + 100 # se suma a cada elemento del vector
c

?sort # el ? muestra la documentación de la funcion que le pasemos despues

sum(c)

videos <- c("video 1", "video 2","video 3","video 4","video 5","video 6")
vistas <- c(123, 1234, 3241, 134, 6546, 5465)
names(vistas) <- videos
names(vistas)
sort(vistas)

#logic vectors

vistas > 500

any(vistas > 500)
all(vistas > 500)

vistas[c(2, 4)]
vistas[-c(2, 4)]

#vectors as sets

yo <- c("just casue 2", "just cause 3", "zelda")
amigo <- c("mario kart", "zelda", "scp fundation")

c(yo, amigo)
union(yo, amigo)

intersect(yo, amigo)

setdiff(yo, amigo)
setdiff(amigo, yo)
setequal(yo, amigo)
"zelda" %in% amigo

c("zelda", "just cause 3") %in% amigo

#random vectors

resultados <- c("victoria", "derrota")
sample(resultados, size = 1) # me da un indice aleatorio en el vector
sample(resultados, size = 10, replace = TRUE)

runif(n = 20, min = 0, max = 2)
rnorm(n = 20, mean = 15, sd = 2)
rbinom(n = 20, size = 1, p = 0.5)

set.seed(123) # ahora siempre va a dar el mismo resultado
?attach

#cuantos numeros de 1 al 1000000 son divisibles entre 6 y 8
numeros <- 1:1000000
sum(numeros%%6 == 0 & numeros%%8 == 0)

compras <- rnorm(n = 10000, mean = 5000, sd = 1000)

compras[c(435, 678)]
sum(compras > 8000)
min(compras)
max(compras)

sum(compras >= 4000 & compras <= 6000)/length(compras)

?sample
sample(1:3, 2)