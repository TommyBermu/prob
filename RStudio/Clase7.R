"La probabilidad en la es la suma del los pesos de todos los puntos
muestrales en A

0 <= P(A) <= 1

dos eventos A y B son mutuamente excluyentes si A ∩ B = ∅

* Una moneda se lanza dos veces, ¿Cual es la probabilidad de que ocurra al 
  menos una cara (H)?

S = {cc, cs, sc, ss}
A = {cc, sc, sc}

P(A) = 1/4 + 1/4 + 1/4 = 3/4

Ej:
Suponga que un dado está cargado de tal manera que la probabilidad de 
observar un número parqu es 2 veces la prob. de obsrevar un número 
impar. ¿Cual es la probabilidad del evento A si se observa un número 
primo?

S = {1y,2x,3y,4x,5y,6x}
x -> probabillidad de un par
y -> probabillidad de un impar

3x + 3y = 1
x = -y + 1/3

## aca deje de poner atención xd, no se si falte algo

B ={1,3,5}
P(B) = 1/2, si es el dado es legal
P(B) = 1/3, si es el dado no es legal

C = {2,4,6}
P(B) = 1/2, si es el dado es legal
P(B) = 2/3, si es el dado no es 

Definición:
la probabilidad de A se define como:

P(A) = n(A) / n(S) 
(siempre que todos los pesos en S sean iguales)
"

### Propiedades ###

"
i)
P(Aᶜ) = 1 - P(A)

ii) 
P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
"

##################################################################
## Probabilidad marginal, conjunta, condicional e independencia ##
##################################################################

"
Ej:
se hacer una encuesta

F = fuma
A = hombre
Aᶜ = mujer
T = total
n = cantidad de individuos

      A    Aᶜ    T
F   n11   n12   nf
Fᶜ  n21   n22   nfᶜ
T   nA    nAᶜ   n

* cuales la probabilidad de que se escoga un fumadro si se elige uno 
al azar?

R/ nf/n

Prob. Conjuntos

* si se elige una mujer, cual es la probabilidad que fume?
  se escribe como P(fume | es mujer) = P(F | Aᶜ)

R/ n12/nAᶜ = (n12/n)/(nAᶜ/n) = P(nAᶜ ∩ F)/P(F)

definicion:
  P(A | B) = P(A ∩ B)/P(B); P(B) > 0
  P(B | A) = P(B ∩ A)/P(A); P(A) > 0
"
# a es que fume
# b es que es hombre
p.b <- 0.6
p.bc <-  1 - p.b # no es hombre

p.a_b <- 0.05 # fuma dado que es hombre
p.a_bc <- 0.1 # fuma dado que no es hombre

p.anb <- p.b * p.a_b # prob. fume y que es hombre
p.anbc <- p.bc * p.a_bc # prob. fume y que no sea hombre

data.frame(.=c("B", "Bc", "Tot"),
           A = c(p.anb, p.anbc, sum(p.anb, p.anbc)), 
           Ac = c(p.b - p.anb, p.bc - p.anbc, sum(p.b - p.anb, p.bc - p.anbc)),
           T = c(p.b, p.bc, 1))
