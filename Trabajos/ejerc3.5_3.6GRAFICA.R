 
 " Ejercicios para discretas y continuas
 
  Ejercicio 3.5
 Determine el valor c de modo que cada una de las siguientes funciones 
 sirva como distribución de probabilidad de la variable aleatoria 
 discreta X:
 
a) f(x) = c(x²+ 4), para x = 0, 1, 2, 3;

b) f(x) =c*choose(2,x)*choose(3,3-x), x =0, 1, 2."
 
 # Sum(c*(x^2+1)) = 1
 
 # sum(c*f.x) = 1
 
 x <- c(0:3);x
 
 k <- sum((x^2+4));k
 
 # cK = 1
 
 c <- 1/k;c
 
 library(MASS)
 
 fractions(c)
 
 # b.
 
 x.1 <- c(0:2)

 k.1 <- sum(choose(2,x.1)*choose(3,3-x.1))

 cchoosec.1 <- 1/k.1
 
y.1 <- c.1*choose(2,x.1)*choose(3,3-x.1);y.1

sum(y.1)

tabl1 <- rbind(x.1,y.1) # rbind es una función que "pega" por fila (row)

tabl1

colnames(tabl1) <- c(".",".",".")

tabl1

library(knitr)

kable(tabl1)

library(flextable) # si la tabla es un data frame

fractions(c.1)  

library(ggplot2) 
 
 f. <- function(x){c*(x^2+4)}
 
 f.(-10)

 y. <- sapply(x, f.);y. # sapply "aplica los valores de un vector a la función
 
 df1 <- data.frame(x,y.);df1
 
 flextable(df1)
 
 sum(df1$y.)

 # Gráfica de la función de probabilidad
 
 ?theme
 ggplot(df1,aes(x = x, y = y.)) +
   geom_point(col = "blue") +
   geom_segment(x = x, xend=x, y=0,yend=y., col="brown", 
                linetype = "dashed") +
   theme(axis.line = element_line(colour = "brown")) +
   labs(title = "Función de probabilidad del ejercicio")
 
 " Ejercicio 3.6. La vida útil, en días, para frascos de cierta 
 medicina de prescripción es una variable aleatoria que tiene
 la siguiente función de densidad:
 
          20000/(x+100)^3, si x > 0
  f(x) = {  
          0,               en otro caso
 
 Calcule la probabilidad de que un frasco de esta medicina tenga 
 una vida útil de
 a) al menos 200 días;
 b) cualquier lapso entre 80 y 120 días."
 
 
" Verificar que es una función de densidad " 

 g.x <- function(x){20000/(x+100)^3}
 
 g.x(-10.234765)
 
 integrate(F.x, lower = 0,upper = Inf)$value  ## Es una función de densidad G(x) = 1
 
 # P(X > 200)
 
 sol.1 <- integrate(g.x, lower = 200,upper = Inf)$value
 
 cat("La P(x>200) es:", sol.1)
 
 ## Otra forma es:
 
# Encontrar F(x), F(x) = P(X<=x) = Int(-inf, x)
 
 F.x <- function(x){integrate(g.x,lower = 0,upper = x)$value}
 
 # P(X>200) = 1- P(X<=200)
 
sol.1a <- 1 - F.x(200);sol.1a
 
### definir la función de densidad como es

 f.x <- function(x){
   if(x <= 0){ 
     return(0)
   } else if (x > 0) {
      return(20000/(x+100)^3)
    }
 }
 " Función vectorizada
 f.x <- function(x) {
   ifelse(x <= 0, 0, 20000/(x + 100)^3)
 } "

 f.x(-5.87) 

 f.x(1) 
 
 integrate(f.x, lower = 80, upper = 120)$value
 
 ### Gráfica
 
 x <- seq(0,140,by = 0.001);x  ## creo una secuencia de 0 hasta 140, incrementando en 0.001
 
 length(x)
 
 y <- sapply(x,f.x);y ## aplico la función f.x a cada dato de la secuencia x
 
 length(y)
 
 df2 <- data.frame(x,y) ## creo el dataframe con los valores de x y y respectivamente
 View(df2)
 
 plot(x,y,type="l",col = "cadetblue", main = "Grafica de la función de densidad")
 ## type: "h" para sobrear debajo de la curva
 ##       "l " para hacer una linea más fina
 lines(x,y)
 
 integrate(g.x,lower = 80, upper = 120)$value ##Integro el la funcion de 80 a 120

# Filtrar para sombrear el área entre 80 y 120
df2_fill <- subset(df2, x >= 80 & x <= 120)

library(grid)  # Necesaria para las flechas

# El gráfico
ggplot(df2, aes(x = x, y = y)) +
  geom_line(color = "darkcyan", size = 1) +
  geom_area(data = df2_fill, aes(x = x, y = y), fill = "purple", alpha = 0.6) +
  scale_x_continuous(expand = c(0, 0), limits = c(0, 141), breaks = seq(0, 141, by = 20)) +  # evitar espacio extra
  scale_y_continuous(expand = c(0, 0), limits = c(0, max(df2$y)*1.1)) +  # más pegado al eje
  theme_minimal(base_size = 14) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 18), # centered title, sz and bold
    axis.title = element_text(face = "bold"), # title ejes bold
    axis.text = element_text(color = "black"), # col text
    axis.line = element_line(color = "black") # mostrar líneas de ejes
    
  ) +
  labs(
    title = "Función de Densidad", x = "x - Dias", y = "f(x) - Probabilidad Efecto Medicinal"
  ) +
  # Flechas simulando los ejes cartesianos
  annotate("segment", x = 0, xend = 140, y = 0, yend = 0,
           arrow = arrow(type = "closed", length = unit(0.3, "cm")),
           color = "black", size = 0.8) +
  annotate("segment", x = 0, xend = 0, y = 0, yend = max(df2$y) * 1.1,
           arrow = arrow(type = "closed", length = unit(0.3, "cm")),
           color = "black", size = 0.8)

 