# tema:  Resúmenes lógicos
# se usan all(): aplica el &  y any() aplica el | es o
## Instalar si aún no lo tienes (solo una vez)###
# install.packages("tidyverse")
# install.packages("nycflights13")

#Usar librerias
library(tidyverse) # usar librería para manipular tabla
library(nycflights13) # usar librería para su conjunto de datos

data(package = "nycflights13") # ver sus tablas

# Averiguar si todos los vuelos se retrasaron en la salida
# como máximo una hora o si algún vuelo se retrasó en la 
# llegada cinco horas o más. 
# Y usando group_by()podemos hacerlo por día

glimpse(flights) # ver columnas sus nombres
flights |> group_by(year, month, day) |> summarise(
  salida_max_1h = all(dep_delay <= 60, na.rm = TRUE),
  # Si no pongo  na.rm = TRUE se devuelve todo NA y da error
  llegada_5h_mas = any(arr_delay >= 300, na.rm = TRUE),
  # operación 5h*60=300
  .groups = "drop" # para no escribir ungroup()
) |> view()

# tema:  Resúmenes numéricos de vectores lógicos
# se usan sum() y mean()

# Hallar la proporción de vuelos que se retrasaron en la salida 
# como máximo una hora y el número de
# vuelos que se retrasaron en la llegada cinco horas o más
flights |> group_by(
  year, month, day
) |> summarise(
  salida_max_1h = mean(dep_delay <= 60, na.rm = TRUE),
  llegada_5h_mas = sum(arr_delay >= 300, na.rm = TRUE),
  .groups = "drop"
) |> view()


# tema:  Subconjuntos lógicos
# se  utiliza el [operador base (también conocido como subconjunto)]

# ¿qué pasa si también queremos calcular el retraso promedio
# para los vuelos que llegaron antes de tiempo ? 
flights |> group_by(
  year, month, day
) |> summarise(
  promedio_retraso = mean(arr_delay[arr_delay>0], na.rm = TRUE),
  promedio_adelanto = mean(arr_delay[arr_delay<0], na.rm = TRUE),
  total = n(),
  .groups = "drop"
) |> view()









