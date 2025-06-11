 "Primera sesion con R 2025-1"
 
 4+3
 
 (5+6)*(81/3^2)
 
3**5

3^5

3**5 == 3^5 # Arroja True si son iguales

exp(1)

exp(0)

sqrt(256) # raiz cuadrada de 256

?log

log(x=48795,base = 10)

log(100,10)

log(x=c(10,100,1000,10000),10)

e <- exp(1) # asignación del número de euler al objeto "e"

e

log(x=c(48795,2345,4321),base = e)

log(x=48795,base = exp(1))

45879*258741

pi # R reconoce el número pi

a <- 3*pi/e;a

a <- round(a,3);a

# Asignación

a1 <- 1:10 # secuencia de enteros del 1 al 10

a1

a2 <- seq(from=1,to=10) # Hace lo mismo que a1

a2

a3 <- seq(1,10,by=0.001)

a3

length(a3)

a4 <- seq(1,10,length=9001)

a4

A <- "casa"

3*A

3*a

" VECTORES"
 
# Los vectores se definen con c minúscula, paréntesis y 
# números o letras entre comilladas separadas por comas

data() # Muestra todas las bases de datos precargadas en el paquete base

?data

data(precip)    # Datos de lluvia

?precip       # Mostrar ayuda

precip

View(precip)       # Imprimir
 
res1 <- summary(precip) # Resumen estadístico

res1

#flextable(res1)

# Primera grafica en R

# Histograma

?hist

hist(x = precip, 
     freq = T, # (logical) frecuencia
     # inicio estilo
     density = 60, 
     col = "darkorchid",
     border = "blue", 
     # fin estilos
     main = "Histograma de pecipitación", # nombre de la grafica
     xlab = "cantidad promedio de lluvia", # nombre del eje x
     ylab = "frecuencia absoluta") # nombre del eje y

boxplot(precip) # Gráfico de cajas

## Funciones internas 

x <- sin(c(pi/2,pi,pi/4,pi/3))

x

cat("El seno de 90,180,45,60 grados es:",x)

paste("El seno de 90,180,45,60 grado es:",x)

print("El seno de 90 grado es 1")


# Para simular el lanzamiento de una moneda podemos escribir

resultado <- c(cara = 1, sello = 0) # se asignan nombres a los componentes

print(resultado)

class(resultado)

attributes(resultado)

names(resultado)

set.seed(410) # Repica los rwsultados para todos

lanz <- sample(resultado, size=10000, replace = TRUE)  # Funcion que toma muestra aleatoria

table(lanz) # Resumen de las frecuencias

dados <- c(1,2,3,4,5,6)

p <- sample(dados, size=1000000, replace = TRUE)

table(p)

## Funciones

f.1 <- function(x){
  0.5*exp(-0.5*x)
  }

f.1(0)

f.1(5)

f.1(-2)

x.1 <- seq(-1,2,by=0.01)
?seq

y.1 <- sapply(x.1, f.1)
?sapply

plot(x.1,y.1,type = "l", col="darkblue", main = "Mi primera gráfica")
?plot