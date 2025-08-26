###############################################
# 📊 Resumen en R para resolver ejercicios de Estadística
# Incluye: Estadística descriptiva, frecuencias, gráficos, probabilidad e inferencia
###############################################

# ===============================
# 1. Cargar datos
# ===============================
# Normalmente trabajamos con vectores o data.frames.
# Ejemplo: notas de un examen
notas <- c(3.5, 4.0, 2.8, 3.7, 4.5, 2.9, 3.3, 3.8, 4.0, 3.2)

# ===============================
# 2. Medidas de Tendencia Central y Dispersión
# ===============================
# Media
mean(notas)

# Mediana
median(notas)

# Moda (no existe función nativa, se define)
moda <- function(x){
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
moda(notas)

# Rango
range(notas)
diff(range(notas))  # valor máximo - mínimo

# Cuartiles
quantile(notas)

# Rango intercuartílico (IQR)
IQR(notas)

# Varianza y Desviación Estándar
var(notas)
sd(notas)

# ===============================
# 3. Tablas de Frecuencia
# ===============================
# Frecuencia absoluta
tabla_abs <- table(notas)
tabla_abs

# Frecuencia relativa
tabla_rel <- prop.table(tabla_abs)
tabla_rel

# Frecuencia acumulada
tabla_acum <- cumsum(tabla_abs)
tabla_acum

# ===============================
# 4. Visualización de Datos
# ===============================
# Histograma
hist(notas, main="Histograma de notas", xlab="Notas", col="lightblue", freq=TRUE)

# Gráfico de barras (para cualitativas)
colores <- c("Azul","Verde","Rojo","Azul","Azul","Verde")
barplot(table(colores), main="Colores preferidos", col=c("blue","green","red"))

# Diagrama de caja (boxplot)
boxplot(notas, main="Boxplot de notas", col="orange")

# ===============================
# 5. Probabilidad y Experimentos Aleatorios
# ===============================
# Definición de un espacio muestral
# Ejemplo: lanzamiento de un dado
espacio_muestral <- 1:6

# Probabilidad clásica de sacar un número par
evento <- c(2,4,6)
p_evento <- length(evento) / length(espacio_muestral)
p_evento

# Probabilidad mediante simulación (frecuencia relativa)
set.seed(123) # para reproducibilidad
simulacion <- sample(espacio_muestral, size=10000, replace=TRUE)
mean(simulacion %in% evento)  # frecuencia relativa

# ===============================
# 6. Probabilidad Condicional
# ===============================
# Ejemplo: baraja simplificada (palos y colores)
cartas <- data.frame(
  valor = rep(1:13, 4),
  palo = rep(c("Corazones","Diamantes","Tréboles","Picas"), each=13),
  color = rep(c("Rojo","Rojo","Negro","Negro"), each=13)
)

# Probabilidad de que salga una carta roja (P(Rojo))
p_rojo <- nrow(subset(cartas, color=="Rojo")) / nrow(cartas)

# Probabilidad de que sea un corazón dado que es rojo (P(Corazones | Rojo))
p_cond <- nrow(subset(cartas, palo=="Corazones")) / nrow(subset(cartas, color=="Rojo"))

p_rojo
p_cond

# ===============================
# 7. Teorema de Bayes
# ===============================
# Ejemplo: test de enfermedad
# P(Enfermedad) = 0.01
# P(Positivo | Enfermedad) = 0.95
# P(Positivo | No Enfermedad) = 0.05

p_enf <- 0.01
p_no_enf <- 0.99
p_pos_dado_enf <- 0.95
p_pos_dado_no_enf <- 0.05

# Probabilidad total de positivo
p_pos <- p_pos_dado_enf*p_enf + p_pos_dado_no_enf*p_no_enf

# Bayes: P(Enfermedad | Positivo)
p_enf_dado_pos <- (p_pos_dado_enf*p_enf) / p_pos
p_enf_dado_pos

# ===============================
# 8. Inferencia Estadística (Estimación de Intervalos)
# ===============================
# Intervalo de confianza para la media
t.test(notas, conf.level=0.95)  # asumiendo normalidad

# ===============================
# 9. Técnicas de Conteo
# ===============================
# Ejemplo con combinaciones y permutaciones
# Número de formas de elegir 3 estudiantes entre 10
choose(10, 3)

# Permutaciones de 5 objetos en 3 posiciones
factorial(5) / factorial(5-3)