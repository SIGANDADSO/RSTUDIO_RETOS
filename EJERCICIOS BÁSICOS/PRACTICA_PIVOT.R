# install.packages("tidyverse")
library(tidyverse)
#Ejercicio 1: pivot_longer() Básico (Formato Ancho a Largo)
#Crear el dataset de práctica
datos_notas <- tibble(
  estudiante = c("Ana", "Carlos", "Luis"),
  matematicas = c(85, 90, 78),
  historia = c(92, 80, 88),
  ciencias = c(78, 85, 95)
)


####APLICACIÓN DE PIVOT_LONGER
datos_notas<- datos_notas |> 
             pivot_longer(
               cols = c("matematicas", "historia", "ciencias"), #¿Qué columnas debo escoger?
               names_to = "Materias",  # ¿Cómo se llamará la columna de los nombres?
               values_to = "nota"   # ¿Cómo se llamará la columna de los valores?
               )
#Creamos una columna del estado de alumnno por cada materia
datos_notas<-datos_notas |> 
             mutate(
               Estado = if_else(nota>=85, "Aprobó", "No aprobo", "??")
             )
datos_notas
#1.¿Cuantos aprobaron en cada matería y no aprobaron?
consulta_estado <- datos_notas |>
  summarise(total = n(), .by = c(Materias, Estado)) |> arrange(desc(total))
consulta_estado

#2.consulta la cantidad de alumnos

cantidad_alumnos <- datos_notas |>distinct(estudiante) |>
  summarise( total = n())
cantidad_alumnos


###APLICACIÓN DE PIVOT_WIDER
#Ejercicio 2: pivot_wider() Básico (Formato Largo a Ancho)
#Crear el dataset de práctica
datos_medicos <- tibble(
  paciente = c("P01", "P01", "P02", "P02"),
  tipo_medicion = c("sistolica", "diastolica", "sistolica", "diastolica"),
  valor = c(120, 80, 140, 90)
)
datos_medicos

datos_medicos<- datos_medicos |> 
    pivot_wider(
      names_from = tipo_medicion, # ¿De dónde salen los nombres de las nuevas columnas?
      values_from = valor # ¿De dónde salen los datos que van a rellenar las columnas?
    )
datos_medicos
# CASO CON PIVOT_LONGER
prueba <- datos_medicos |>
  pivot_longer(cols = -paciente, # AQUI SE FIJA LA COLUMNA PACIENTE Y EL RESTO SE MUEVE
               names_to = "tipo_medicion",
               values_to = "valor")
prueba


