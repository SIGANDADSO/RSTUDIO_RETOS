# tema:  Valores faltantes

## Instalar si aún no lo tienes (solo una vez)###
# install.packages("tidyverse")
# install.packages("nycflights13")

#Usar librerias
library(tidyverse) # usar librería para manipular tabla
library(nycflights13) # usar librería para su conjunto de datos

data(package = "nycflights13") # ver sus tablas

view(planes)# revisar esta tabla para usar la función is.na(): da true si es NA(DATO FALTANTE)
planes |> filter(is.na(speed)) |> view()
planes |> filter(!is.na(speed)) |> arrange(desc(speed)) |> view() # solo ver lo que tengan números





