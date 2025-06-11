##############################################
############### PROBABILIDAD #################
##############################################

" La probabilidad es una rama de las matemáticas "

# Walpole cap. 2,3 -> parcial 2
# Walpole cap. 4,5,6 -> parcial 3

# Manual de R cap. 23, 24 -> ta en internet

# Regrasión en R 

##################
# Espacio muestral
"
Resultados de un experimento, se llama espacio muestral a 'S'

S puede ser: finito o infinito numerable discreto
             infinito no numerable
             
ej:
S = {cara, sello} -> moneda
S = {1,2,3,4,5,6} -> dado
S = {ccc, ccs, ..., sss} -> 3 monedas
    este nos da un diagrama de árbol 
    
Si se tienen n resultados posibles para un experimento y se realiza m veces
hay un total de n^m resultados

Conjunto por extensión o por comprensión: Cuando se nombra el conjunto pero
                                          no sus elementos
ej:
S = {ciudades con más de un millón de habitantes}
S = {(x, y) | x^2 + y^2 <= 4} -> infinito

Cuando un conjunto es un subconjunto de los Naturales, y es infinito, se 
les llama infinitos numerables

ej:
- Naturales
- Naturales pares

Evento: Cualquier subconjunto de S
ej:
- ∅, S

* Se lanza una moneda 3 veces, sea A el evento en el que se observaron 2
  caras exactamente
  
  A = {ccs, csc, scc}
  
  se observan POR LO MENOS dos caras
  
  A = {{ccs, csc, scc, ccc}
  
  se observan cuatro caras
  
  A = {∅} 
*

Unión: {x ∈ S | x∈A v x∈B}

Intersección: {x ∈ S | x∈A ^ x∈B}

Complemento: {x ∈ S | x∉A}

Aᶜ U A = S
"

##### Ejemplo de operaciones entre conjuntos #####

S <- 1:6 # Espacio muestral

A <- c(1,2,3,5)

B <- c(2,4,5,6)

C <- c(2,3,6)

E <- setdiff(S,A)
E
EnB <-intersect(E,B)
EnB
M <- intersect(A,B)
M
N <- setdiff(S,M)
N
P <- union(N,C)
P
cat("La repuesta a la pregunta 1 es:",P)

intersect(intersect(setdiff(S,B),C),setdiff(S,A))
#intersección entre (la intersección del complemento de B y C) y el complemento de A