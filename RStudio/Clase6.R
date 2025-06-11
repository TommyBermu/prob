########################################
######### Técnicas de conteo ###########
########################################

# Regla de la multiplicación
"Si un experimento puede realizarse de N1 maneras y para cada una de esas 
N1 maneras existen N2 maneras, el número total de resultados de ese 
experimento es N1 * N2

Ej:
El Número de rutas para llegar a la univerdidad es 3 y por cada ruta se
pueden usar 4 buses, cuantos buses le sirven?
R/ 3 * 4 = 12 "

# Permutación
"Ordenar k elementos de un conjunto de n elementos en los que el orden
importa
k <= n 

Ej:

S = {a,e,i,o,u}
n = 5, k = 3  meter 3 elementos en un cajón en el que el orden importa

[5|4|3] = 5 * 4 * 3 = 60
5 elementos * 4 elementos restantes * 3 elementos restantes

P(n/k) == nPk == n! / (n-k)!

P(5 / 3) = 5! / 2! 
         = (5 * 4 * 3 * 2 * 1) / (2 * 1)
         = 5 * 4 * 3
         = 60 "

fact <- function(n){
  a <-  1
  if(n == 0) return(a)
  for(x in 2:n) a <- a * x
  return(a)
}

perm <- function(n,k) fact(n) / fact(n-k)

perm(5,0)
perm(5,5)
perm(0,1)

# Combinación
"El orden de k elementos tomados de un conjunto de n elementos, NO importa

C(n/k) == nCk == (nPk) / k! == n! / [(n-k)! * k!]

Ej:
S = {a,e,i,o,u}
n = 5, k = 3
{eia}, {iae}, {aei}, {aie}, {eai}, {iea} son la misma

P(5 / 3) = 5! / (2! * 3!) 
         = (5 * 4 * 3 * 2 * 1) / [(2 * 1) * (3 * 2 * 1)]
         = 5 * 4 / 2 * 1
         = 10 "

comb <- function(n,k) perm(n,k) / fact(k)

comb(5,3)

choose(5,3) ## También calcula la combinatoria entre n y k

?combn

voc <- c(a=1,e=2,i=3,o=4,u=5)

zm <- combn(x=voc,m=3)

zm
