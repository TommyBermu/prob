##############################################################
### Capitulo 5 y 6: Algunas distribuciones de probabilidad ###
##############################################################
"
Dicreto: X es una variable aleatoria discreta
Continuo: X es una vaeriable aleatoria continua

Lo que se estudiará son modelos definidos por unas carácteristicas que los 
identifican.

Siempre que se estudien los modelos se analizarán:
Valor esperado, Varianza, Función de distribución acomulativa

La notación será X~ nombre de la distribución y parámetro
"

### Distribuciones discretas ###
"
  1) Binomial
  2)  Hipergeométrica
  3) Poisson
"

### Distribuciones continuas ###
"
  4) Uniforme continua
  5) Normal
  6) Exponencial
  7) Distribución t
  8) Chincuadrada
  9) F
"

### Distribucion binomial ###
"
- consta de ensayos independientes 
  - cada ensayo tiene un éxito o fracaso
  - el éxito tiene probabilidad p y el fracaso = 1-p = q (p+q=1)
  - la valiable aleatoria a estudiar va a ser: el número de éxitos en los
    ensayos
  
  ej: se lanza 10 veces un dado legal, se quiere conocer cual es la probabilidad
      de obetener al menos 7 veces el 6?
      
      n = 10 , p= 1/6 , q = 5/6
      
      X: el número de veces en que se obtiene el 6
      P(x >= 7) = P(X = 7) + P(X = 8)
      f(x) = P(X = x) = 
      
      X~b(x; n, p)
      X~binomial(valores que toma x ; # de ensayos, # de éxitos)
      
      
  DEFINICIÓN:
  Una variable aleatoria discreta X, se distribuye en forma binomial si su 
  función de probabilidad vienen dada por la siguiente expresión:
  
  <><><><><><><><><><><><><><><><><><><><><><><><><><><>
  
  f(x) = P(X = x) nCx * p^x * q^(n-x) ; x = {0,1,..., x}
  
  <><><><><><><><><><><><><><><><><><><><><><><><><><><>
  
  VALOR ESPERADO Y LA VARIANZA PARA x~b(x; n, p)
  E(X) = n*p 
  V(X) = n*p*q 
"

n = 10
p = 1/6
q = 1-p
x <- 0:10

f.1 <- function(x){
  
}

y <- sapply(x, f.1)

sum(y)

df1 <- data.frame()