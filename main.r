# Instalar la librería si no la tienes
# install.packages("gemini.R")

# Cargar la librería
library(gemini.R)

# Asigna tu clave API a una variable de entorno
Sys.setenv(GEMINI_API_KEY = "AIzaSyBjFAvEl2f8KolPsJwr2Z1ES_nqXLwSEDc")

# Opcional: Verifica que la clave se ha guardado correctamente
Sys.getenv("GEMINI_API_KEY")

# Definir el mensaje a enviar
message <- "En un restaurante de comida rápida el 75% de los pedidos se sirve con exactitud. El número de pedidos servidos con exactitud puede modelarse como una variable aleatoria binomial. Si usted va con cuatro amigos más, ¿Cuál es la probabilidad de que entre 1 y 4 pedidos inclusive se sirvan con exactitud?"

# Enviar la consulta a la API de Gemini
response <- gemini.R::gemini(message)

# Imprimir la respuesta
print(response)

# Opcional: Acceder al texto de la respuesta
respuesta_generada <- response$content
print(respuesta_generada)
