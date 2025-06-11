########################################
### Capitulo 4: Esperanza matemática ###
########################################

### Valor esperado ###
"
µx = E(X) = { Σ x*f(x) , si x es discreta 
            { ∫ x*f(x) dx, si x es continua

sea x una variable discrta con función de probabilidad

  x |  0  |  1  |  2  |  3  |
f(x)| 0.2 | 0.3 | 0.3 | 0.2 |

µx =  Σ(0->3)  x*f(x) = 0*0.2 + 1*0.3 + 2*0.3 + 3*0.2 = 1.5

valor esperado = 1.5

Ejemplo:
se participa en una rifa en donde el premio son 1'000.000 de pesos :DD
y el precio para participar es de 15.000 pesos

  x |  -15.000  |  985.000  |
f(x)|   99/100  |   1/100   |

µx = -15000*0.99 + 985000*0.01 = -5000
cada vez que juege, en promedio voy a perder 5000 pesos DD:


Sea X una variable aleatoria, f(x) una funcion de probabilidad, el valor esperado
de la variable g(X):

µg(x) = E(g(X)) = { Σ g(x)*f(x) , si x es discreta 
                  { ∫ g(x)*f(x) dx, si x es continua
"

### Varianza de X ###

"
Sea X una variable aleatoria con distribución de probabilidad f(x) y media μ. 
La varianza de X es:

como si: g(X) = (X – μ)^2


σ^2 = V(X) = E[(X - µ)^2] = { Σ (x - µ)^2 *f(x) , si x es discreta 
                      { ∫ (x - µ)^2 *f(x) dx, si x es continua

La raíz cuadrada positiva de la varianza se llama deviación estandar σ de X

La desviación estandar es la medida en el eje x desde el punto mas alto hasta el 
punto en el que la distribución cambia su concavidad

Otra forma de escribir la varianza: 

  - σ^2 = E(X^2) - µ^2 = E(X^2) - E(X)^2

Propiedades de V(X)

  i) V(aX + b) = a*V(X) + b
  ii) V(b) = 0
  iii) V(aX) = a*V(X)
"

### Teorema de Chebyschev ###

"
Sea X una V.A. entonces para f(x) se cumple que:
P(|X - µ| <= k*σ) >= 1 - (1/k^2)

a dos desviaciones estandar de la media, se encuentran el 75% de los datos
"

f <- function(x) (1/2) * exp(-0.5*x)
integrate(f, 0, upper = Inf)$value

library(ggplot2)

x <- 0:4


f.x <- c(0.41, 0.37, 0.16, 0.05, 0.01)

df1 <- data.frame(x, f.x)

ggplot(df1, aes(x, f.x)) + 
  geom_point(col = "purple") + 
  geom_segment(stat = "identity", x = x, xend = x, y = 0, yend = f.x, linetype = "dashed") + 
  labs(title = "Grafica de ejercicio")

sum(df1$f.x)

e.x <- sum(x*f.x)

cat("El valor esperado es ", e.x)

e.x2 <- sum(x^2 * f.x)

v.x <- e.x2 - e.x^2 # formula de la linea 56

cat("La varianza de x es: ", v.x)


###############################
## Ejercicio 4.8 del Walpole ##
###############################
"
Suponga que un distribuidor de joyería antigua está interesado en comprar un 
collar de oro para el que tiene 0.22 de probabilidades de venderlo con $250 de
utilidad; 0.36 de venderlo con $150 de utilidad; 0.28 de venderlo al costo y 
0.14 de venderlo con una pérdida de $150.

  a) ¿Cuál es su utilidad esperada?
  b) ¿Cuál es la desviación estandar?
  c) Grafique la función de probabilidad
"

# a)
ut <- c(-150, 0, 150, 250)
f.ut <- c(0.14, 0.28, 0.36, 0.22)

e.ut <- sum(ut * f.ut)
cat("El valor esperado es: ", e.ut) # Respuesta

# b)
e.ut2 <- sum((ut^2) * f.ut)
v.ut <- e.ut2 - e.ut^2
cat("La desviación estandar es: ", sqrt(v.ut)) # Respuesta

# c)
df2 <- data.frame(ut, f.ut)
ggplot(df2, aes(ut, f.ut)) + 
  geom_point(col = "red") + 
  geom_segment(stat = "identity", x = ut, xend = ut, y = 0, yend = f.ut, linetype = "dashed") + 
  labs(title = "Grafica de ejercicio")
