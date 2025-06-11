############################
### Variables aleatorias ###
############################

"
Variables Aleatorias:

Una v = a, es una función cuyo dominio es el espacio muestral y el
codominio es el subconjunto de los números reales

## Nota: las variables aleatorias se simbolizan con letras mayúsculas
(generalmente las últimas del alfabeto)

Dominio e la función:
  1) discreto - V.A. discreta xd
  2) continuo - V.A. continuo
  
Ejemplo i:
  Se lanza una moneda 3 vees y se define X, la V.A. como el número de
  caras
  
  S = {ccc, ccs, csc, scc, css, scs, ssc, sss}
  
  X = 0,1,2,3
  
  ¿Cuál es la prob. de que X = 0?
  P(X = 0) = 1/8
  etc...
  P(X = 1) = 3/8
  P(X = 2) = 3/8
  P(X = 3) = 1/8
  
Ejemplo ii:
  Un borrachito quiere abrir la puerta con un manojo de llaves,
  defina el espacio muestral.
  
  E = entra
  F = falla xd
  
  S = {F, FE, FFE, FFFE, FFFFE, ...}
  puede no entrar nunca xd
"

################################################
### Distribuciones discretas de probabilidad ###
################################################

"
El conjunto de pares ordenados (x,, f(x)) es una función de 
probabilidad, de una función de masa de probabilidad o una
distribución de probabilidad de la variable aleatoria discreta X si 
para cada resultado x posible,

1) f(x) >= 0 -> Una función de probabilidad no puede ser negativa
2) Σ f(x) = 1 -> La suma de todos los valores de x debe ser 1 xd
3) P(X = x) = f(x) -> la probabilidad de que X sea igual a x
"

##############################################################
### Variables aleatorias y su distribucion de probabilidad ###
##############################################################

## Ejemplo 3.8

"Un embarque de 20 computadoras portátiles similares para una tienda minorista contiene
3 que están defectuosas. Si una escuela compra al azar 2 de estas computadoras, calcule
la distribución de probabilidad para el número de computadoras defectuosas."

# P(X = x)= f(x)

N <- 20 # Nunero total de comp

n <- 2  # tamaño de la muestra

k <- 3  # num de comp defectuosos

Nk <- N - k # num de comp buenos

x <- 0:2 # valores que puede tomar x

f.x <- round(choose(k,x)*choose(N-k,n-x)/choose(N,n),3);f.x

sum(f.x)

tbl3.8 <- data.frame(x,f.x)

library(knitr)

plot(x,f.x,main = "Distribución de prob del ejemplo", pch =16,col="blue")

segments(x0 = 0, x1 = 0,y0 = 0,y1 = tbl3.8[1,2],lwd= 0.3)

tbl3.8[2,2]

?segments

segments(x0 = 1, x1 = 1, y0 = 0, y1 = tbl3.8[2,2],lwd=0.3)

segments(x0 = 2, x1 = 2, y0 = 0, y1 = tbl3.8[3,2], lwd = 0.3)

library(ggplot2)

ggplot(data = tbl3.8, aes(x = x,y = f.x)) +
  geom_point(col='brown') +
  geom_segment(aes(x = x,y =0 ,xend = x,yend = f.x),
               col="cadetblue",linetype = "dashed") +
  labs(title = "Distribución de probabilidad del ejemplo")

" Ejemplo"

x <- 0:4

p.x <- c(0.2,0.2,0.3,0.2,0.1)

sum(p.x)

df <- data.frame(x,p.x)

 ggplot(data = df, aes(x=x,y=p.x)) +
  geom_point(col='brown') +
  geom_segment(aes(x=x,y=0,xend=x,yend=p.x),linetype = "dashed",col="brown") +
  ylim(0,0.35) +
  labs(title=' Gráfica de la función de distribución') +
  geom_segment(aes(x = 0, xend = 4.2, y = 0, yend = 0)) +
   theme_minimal() 
  
   ##########################################################
 
   ##### Funcion de distribucion acumulativa ######
  
 
x <- 0:4
 
f.x <- c(1/5,1/5,2/5,1/10,1/10) # Función de probabilidad

df1 <- data.frame(x,f.x);df1

library(ggplot2)

ggplot(data = df1, aes(x = x,y = f.x)) +
  geom_point(col='brown') +
  geom_segment(aes(x = x,y =0 ,xend = x,yend = f.x),
               col="cadetblue",linetype = "dashed") +
  labs(title = "Distribución de probabilidad del ejemplo")


" Función de distribución acumulativa, versión 1"

F.x <- function(x){
  if (x < 0){
    rta <- 0
  } else if (0 <= x & x < 1){
    rta <- 0.2
  } else if (1 <= x & x < 2){
    rta <- 0.2 + 0.2
  } else if (2 <= x & x < 3){
    rta <- 0.4 + 0.4
  } else if (3 <= x & x < 4){
    rta <- 0.8 + 0.1
  } else if (4<= x){
    rta <- 1
  }
  return(rta)
}
  
F.x(3.97)

" Versión 2"

F.x. <- function(x){
  ifelse(x < 0,0,
         ifelse(x < 1,0.2,
                ifelse(x < 2,0.4,
                       ifelse(x < 3,0.7,
                              ifelse(x < 4,0.9,1)))))
}

F.x.(3.9999)

F.x.(2.87)

x <- seq(-3, 6, by = 0.01)  # Crea un vector de -3 a 6 con pasos de 0.1

fda_valores <- sapply(x, F.x) 
  
library(ggplot2)

df <- data.frame(x = x, fda = fda_valores)

ggplot(df, aes(x = x, y = fda)) +
  geom_line() +
  labs(x = "Valores de x", y = "Probabilidad acumulativa") +
  ggtitle("Función de Distribución Acumulativa (FDA)")

" Versión 3"

x <- c(0:4)

f.x <- function(x) {
  if (x == 0) return(0.2)
  else if (x == 1) return(0.2)
  else if (x == 2) return(0.3)
  else if (x == 3) return(0.2)
  else if (x == 4) return(0.1)
  else return(0)
}

f.x(0)

### Definir F como un for

F.x <- function(x) {
  Fx <- 0
  for (i in -1:x) {
    Fx <- Fx + f.x(i)
  }
  return(Fx)
}

F.x(6)

