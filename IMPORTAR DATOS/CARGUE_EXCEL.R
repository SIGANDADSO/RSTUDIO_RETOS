install.packages("tidyverse") # cargar paquete
install.packages("writexl") # caso de instalar el paquete y de errores toca primero hacer  unlink("C:/Users/EQUIPO/AppData/Local/R/win-library/4.6/00LOCK", recursive = TRUE)
library(tidyverse) # Incluye dplyr y readr
library(readxl) # Para leer archivos Excel
library(writexl) # para guardar excel en equipo

#Importar archivo excel
datos_clientes <- read_excel(file.choose())
datos_clientes

# Separar la columna "Fecha de alta" en dos nuevas columnas
datos_clientes <- datos_clientes %>%
  mutate(
    Fecha_De_Alta = as.Date(`Fecha de alta`),
    # Extrae solo el año-mes-día
    Hora_Salida  = format(`Fecha de alta`, "%H:%M:%S") # Extrae solo la hora
  )

# Ver el resultado
datos_clientes
view(datos_clientes) # ver tabla

#ver nombres de columnas
names(datos_clientes)

# eliminar algunas columnas
datos_clientes <- datos_clientes |>
  select(-`Fecha de alta`, -`Fecha`, -`Hora`)
datos_clientes

# renombrar nombres de columna para facilitar trabajo
datos_clientes <- datos_clientes |>
  rename(
    Fecha_de_nacimiento = `Fecha de nacimiento`,
    Localidad_y_Código_postal = `Localidad y Código postal`,
    Correo_electrónico = `Correo electrónico`,
    Nombre_completo = `Nombre completo`,
    Grupo_de_clientes = `Grupo de clientes`
  )
datos_clientes # tabla definitiva para trabajar las preguntas
#ver tabla
view(datos_clientes)
# guardar tabla modificada
write_xlsx(datos_clientes, path = 'datos_clientes_modificado.xlsx')

###########Preguntas#############

#1.Pregunta: Filtra la lista para mostrar solamente 
#a los clientes que pertenecen al Grupo de clientes "A".
p1 <- datos_clientes |> filter(Grupo_de_clientes ==  "A")
p1
view(p1)

#2.Pregunta: Obtén los datos de todos los 
#clientes nacidos a partir del 1 de enero de 1990
p2 <- datos_clientes |> filter(Fecha_de_nacimiento >= "1990-01-01") |>
  arrange(Fecha_de_nacimiento)
p2
view(p2)

#3.Selecciona únicamente los primeros 15 registros
#(filas de la 1 a la 15) de la lista de clientes.
p3 <- datos_clientes |>  slice(1:15)
p3

#4. Pregunta: Extrae una lista con los valores únicos
#que existen en la columna
p4 <- datos_clientes |> distinct(Grupo_de_clientes) |> 
             arrange(Grupo_de_clientes)
p4


#5.Pregunta: Crea un data frame que conserve únicamente el ID del cliente 
#y cree una nueva columna llamada anio_nacimiento extrayendo el año de 
#la columna Fecha de nacimiento 
#(puedes usar la función year() o format()).

p5 <- datos_clientes |> transmute(ID, anio_nacimiento = year(Fecha_de_nacimiento))
p5

p5B <- datos_clientes |> transmute(ID,anio_nacimiento = format(Fecha_de_nacimiento, "%Y")  )
p5B

#6. Pregunta: Crea un data frame que conserve el ID, Nombre completo y
#una nueva columna lógica llamada es_cliente_antiguo que sea TRUE
#si la Fecha de alta fue antes del año 2010.

p6 <- datos_clientes |> transmute(ID, es_cliente_antiguo = Fecha_De_Alta < as.Date(2010-01-01))
p6

#7.Pregunta: Agrupa los datos por Grupo de clientes y 
#calcula cuántos clientes hay en cada grupo (usando n()). 
#Asegúrate de retirar la agrupación al final con ungroup()


p7 <- datos_clientes |> group_by(Grupo_de_clientes) |>  summarise(total_clientes = n()) |>
  ungroup()
p7

#8.Pregunta: Resuelve el ejercicio anterior (contar la cantidad de clientes por grupo), 
#pero utilizando directamente el argumento .by 
#dentro de summarise() en lugar de utilizar group_by()
p8 <- datos_clientes |> summarise(total_clientes = n(), .by = Grupo_de_clientes) |>
  arrange(Grupo_de_clientes) |>
  ungroup()
p8

#9.Pregunta: Filtra únicamente los clientes nacidos entre 1980 y 1990, 
#agrúpalos por Grupo de clientes y calcula 
#la fecha de alta más reciente (max(Fecha de alta)) para cada grupo.
p9 <- datos_clientes |> filter(year(Fecha_de_nacimiento) %in% 1980:1990) |>  # se puede hacer filter( year(Fecha_de_nacimiento)>=1980 & year((Fecha_de_nacimiento)<=1990)
  summarise(Fecha_Alta_Reciente = max(Fecha_De_Alta),
            .by = Grupo_de_clientes) |>  arrange(Grupo_de_clientes)
p9
view(p9)
# 10. Pregunta: ver los clientes con esa fecha de alta reciente
p10 <- datos_clientes |> filter(year(Fecha_de_nacimiento) %in% 1980:1990) |>
  group_by(Grupo_de_clientes) |>
  mutate(fecha_reciente = max(Fecha_De_Alta)) |>
  filter(Fecha_De_Alta == fecha_reciente) |>
  select(Nombre_completo, Grupo_de_clientes, fecha_reciente) |> ungroup()
p10
view(p10)       








