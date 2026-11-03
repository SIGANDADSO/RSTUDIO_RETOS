library(tidyverse) #importamos la libreria Tidyverse
######RETO DEL DÍA#############

#############1################
videojuegos <- data.frame(
  jugador = c("Carlos", "Elena", "Pedro", "Ana", "Luis"),
  puntos = c(1500, 2300, 1500, 4100, 2300),
  consola = c("Xbox", "PlayStation", "PC", "PC", "Xbox")
)# DATA.FRAME DE VIDEOJUEGOS

videojuegos # IMPRIMIR TABLA

# 1. Filtre para dejar únicamente a los jugadores de PC y Xbox.
videojuegos |> filter(consola %in% c('PC', 'Xbox'))
# 2. Calcule el promedio de puntos y el total de jugadores agrupados por cada consola.
# 3. Asegúrate de convertir el promedio a número entero puro (as.integer) para que no salga con el punto final (.) en la consola.
videojuegos |> group_by(consola) |>
  summarise(promedio = as.integer(mean(puntos, na.rm = TRUE)),
            total_jugadores = n()) |> ungroup() |> arrange(desc(total_jugadores))

#############2################
#Resolver las siguientes ecuaciones 2x+3y=20 y 4x+y=15
#primero los x (2,4)y luego los y(3,1)
matriz_ecuaciones<- matrix(c(2,4,3,1), nrow = 2, ncol = 2)
matriz_ecuaciones
#ahora los equivalentes
b<-c(20,15)
#solucion
?solve
solutions<-solve(matriz_ecuaciones, b)
names(solutions)<-c("x", "y")
print(solutions)







