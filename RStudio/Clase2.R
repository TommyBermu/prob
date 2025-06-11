
### Instalación de paquetes que nos servirán ####

library(dplyr)

library(descriptr)

library(ggplot2)

library(datos)

############

# Gráficas #

############

# Datos cualitativos: Torta y barras

# Datos cuantitativos discretos: torta y barras

# Graficas para datos cualitativos

# Grafico de barra  con frecuencia absoluta

# barplot es la funcion que grafica diagrama de barras
# para variables cualitativas discretas

?datos

View(encuesta)

datos.e <- encuesta

set.seed(252) # Sembrar una semilla

datos.m <- sample_n(tbl=datos.e,size = 2000,replace = FALSE)
?sample_n # toma una muestra aleatoria de un conjunto de datos

View(datos.m)

head(datos.m,10) # muestra los 10 primeros

tail(datos.m,10) # muestra los 10 últimos

str(datos.m) # describe el tipo de variable

names(datos.m)

attach(datos.m) # se ancla la tabla de datos
?attach # se usa attach para que en vez de datos.m$estado_civil se usa solo estado_civil

frela1 <- table(estado_civil) # frecuencia para estado civil

frela1 # tabla de frecuencia para estado civil

frela2 <- table(datos.m$raza) #TABLA DE FRECUENCIAS PARA RAZA

frela2

# Diagrama de barras para estado civil y raza

?barplot

barplot(frela1)

barplot(frela2 , col = c("darkblue","purple","#008080","cadetblue3"),
        horiz = FALSE, ylab = "Frecuencia absoluta" , border = TRUE,
        ylim = c(0,2000),xlab="Categorías de raza", main = " Gráfico de barras para raza")


#Grafico tipo pastel

#pie es la grafica de tipo torta para variable cualitativas o cuantitativas discretas

pie(frela2,labels = names(frela2),
    density=NULL,edges = 500, radius = 1.2,
    col=c("aquamarine1","antiquewhite2", "purple","darkseagreen2"),
    clockwise = TRUE, main = "Primer diagrama de torta",
    border = "blue")

?pie

# elaborar un pie  y u. diagrama de barra mucho mejor para religión

#########################

#      Otra manera

#########################

### Usando ggplot

?encuesta

" Ejemplo de la funcion muestra "

set.seed(25) # Sembrar una semilla para que los resultados sean iguales
 
sample(x=22,size=3) # Toma una muestra aleatoria de n =3 de un conjunto de 10

# Tomando una muestra de 200 datos

# Gráfica para variables cualitativas


names(datos.m) # los nombres de las variables de la base de datos 

str(datos.m) # Indica la clase de variable que se tiene

# Diagrama de barras para la variable claridad

# Tabla de frecuencias

frec_estado.civil <- table(datos.m$estado_civil)

frec_estado.civil

# Primer grafico de barras

?barplot

#barplot grafico normal

barplot(frec_estado.civil, width = 1.3, ylim=c(0,1000),col = 'cadetblue',
        border = '#B03060',ylab="Frecuencia absoluta",main = "Diagrama de barras para el estado civil",
        xlab = "Categoría", density = 25)

# install.packages("ggplot2")

# Para usar ggplot se necesita los datos en un dataframe

# verificando si es dataframe

is.data.frame(frec_estado.civil)

# Convirtiendo la tabla en data frame

df <- as.data.frame(frec_estado.civil)

is.data.frame(df)

df

View(df)

library(WriteXLS)

?WriteXLS

WriteXLS(df, "df1.xls") # TODO VER POR QUÉ NO FUNCIONA (creo que hay que instalar Perl)

attach(df)  ## guarda en memoria temporal las variables de la base de datos

df <- rename(df, clase = Var1, frecuencia = Freq) # renombra las columnas del dataframe
?rename
View(df)

df2 <- data.frame(Clase = df$clase, Frequencia = df$frecuencia)
?data.frame

View(df2)

diag_barra <- ggplot(df, aes(x = clase, y=frecuencia, fill = clase)) + # aes() estetica, decirle que es cada columna
  geom_bar(stat = 'identity') # se le agrega capas -> + geom_*

?geom_col()
diag_barra

#  Agregando texto

diag_barra <- ggplot(df, aes(x = clase, y=valor)) +
                geom_col() +
                geom_text(aes(label = clase), vjust = 1, colour = "blue")

diag_barra

# texto 

diag_barra <- ggplot(df, aes(x = clase, y=valor)) +
                geom_col() +
                geom_text(aes(label = clase), vjust = -1, colour = "red") +
                ylim(c(0,60)) 
diag_barra
  
# Cambiando color

?geom_bar


  
# Color por clase
  
diag_barra <- ggplot(df, aes(x = clase, y = valor, fill = clase)) +
                 geom_bar(stat = 'identity') +
                 ylim(c(0,100)) 
diag_barra

   
# Grafica de torta

?pie

torta1 <- pie(frec_estado.civil,labels = 'Torta',radius = 0.8)


torta1 <- pie(frec_estado.civil, labels = c("Sin Resp","Nunca Casado","Separado",
                                            "Divorciado","Viudo","Casado"), 
              main="Diagrama de tarta",radius = 0.8)

names(df)

attach(df)

pct <- round(valor/sum(valor)*100)


etiquetas <- paste(clase, pct) # Adicionando porcentajes a etiquetas

etiquetas <- paste(etiquetas,"%") # Adicionando el símbolo de %

torta2 <- pie(pct,labels = etiquetas, radius = 0.8,
    col=rainbow(length(etiquetas)),
    main="Diagrama de torta")

# Adicionando un cuadro con leyendas

legend("topright", c("Sin Resp","Nunca Casado","Separado","Divorciado",
                     "Viudo","Casado"), 
       cex = 0.5,  fill = rainbow(length(etiquetas)))

# En tres dimensiones

install.packages("plotrix")

library(plotrix)

torta2 <- pie3D(frecuencia,labels=etiquetas,radius = 0.5,
      explode=0.3, height=0.3,labelcex = 1.0,theta=pi/4,
      main="Diagrama de tarfta")

torta2

#pie3D.labels()

# Con ggplot

torta3 <- ggplot(df,aes(x="", y = frecuencia,fill=clase)) +
  geom_col(color='blue') +
  geom_text(aes(label = clase),
            position = position_stack(vjust = 0.5))+
  coord_polar(theta = 'y') 

torta3

### Con la función ds_auto_freq_table del paquete descriptr

ds_auto_summary_stats(datos.m)

names(datos.m)

ds_freq_table(datos.m,estado_civil)
?ds_freq_table

plot(ds_freq_table(datos.m,estado_civil))

######################################

# Otro ejemplo con variables discretas

######################################

#Se crea un vector de datos que contiene el numero de fallas presentadas por
#30 estudiantes en un curso de proba en el primer semestre 2025

fallas  <-  c(1,3,1,1,0,1,0,1,1,0,2,2,0,0,0,1,2,1,2,0,0,1,6,4,3,3,1,2,4,0)

n <-  length(fallas);n #Tamaño del vector

aux <-  table(fallas);aux #Se crea una tabla de conteo aux, con el vector de datos fallas

p <- round(prop.table(aux,margin = NULL),3)*100;p # porcentajes

#Se crea un data.frame con la tabla de conteo aux de frecuencia absoluta 

datos1 <-  data.frame(aux); datos1

#Se crea un data.frame con la tabla de conteo aux de frecuencia relativa en porcentaje

datos2 <-  data.frame(p);datos2

#Se crea un data.frame con la tabla de conteo aux de frecuencia absoluta y relativa en porcentaje

final  <-  data.frame(fallas=datos1[,1], ni=datos1[,2], fi=round(datos2[,2],3)) # [,2] -> [filas, columnas] no hacer nada con las filas y usar la columna 2
View(final)

#Se crea un data.frame con la tabla de conteo aux de frecuencias

final1 <-  data.frame(xi=final$fallas, frec=final$ni, fr=final$fi, Fai=cumsum(final$ni), Fri=cumsum(final$fi))
View(final1)

#Grafica de barras con el numero de fallas presentadas por 30 estudiantes

barplot(final[,2],xlab="Número de fallas",ylab="Frecuencia absoluta", col=c("blue","red","yellow","green","gray","pink"), main = "Diagrama de barra")

fallas <-  c(0,1,2,3,4,6)

pie(aux, label=fallas, radius = 2.5)

install.packages('plotrix')

pie3D(aux)
