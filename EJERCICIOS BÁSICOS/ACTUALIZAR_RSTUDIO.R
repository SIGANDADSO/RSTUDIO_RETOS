# 1. Instala el paquete 'installr' desde los servidores oficiales (CRAN).
# El argumento 'dependencies = TRUE' asegura que también se instalen otras 
# herramientas necesarias para que el paquete funcione correctamente.
install.packages("installr", dependencies = TRUE)

# 2. Carga y activa la librería 'installr' en tu sesión actual de RStudio 
# para poder utilizar todas sus funciones de actualización.
library(installr)

# 3. Ejecuta la función principal que busca la versión más reciente de R,
# la descarga, la instala y te guía para migrar tus paquetes antiguos.
updateR()
#Cierra Rstudio

# 4. Abrir nuevamente y dirijirse  a Tools y click en global opcions
#en General esta la opción version y selecciona la nueva versión 
#(En Windows me toca así para ver actualización)
# cierra y luego abre Rstudio

# 5.Ejecuta esta línea en tu consola para comprobar qué versión tienes activa ahora mismo:
version
