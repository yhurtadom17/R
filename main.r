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

# Cuartiles y cuantiles específicos
quantile(notas)
# Percentiles 10%, 50% y 90%
quantile(notas, probs = c(0.1, 0.5, 0.9))
# Todos los percentiles
quantile(notas, probs = seq(0, 1, 0.1))
# Cuartiles
quantile(x, probs = c(0, 0.25, 0.5, 0.75, 1))

# Rango intercuartílico (IQR)
IQR(notas)

# Varianza y Desviación Estándar
var(notas)
sd(notas)

# Coeficiente de variación
coef_v <- desv_estandar/media

# Funciones básicas de resumen general

summary(x) # → resumen general (mínimo, cuartiles, mediana, media, máximo).

fivenum(x) # → cinco números de Tukey (mínimo, Q1, mediana, Q3, máximo).

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

# Histograma con clases en R
hist(datos, breaks = "sturges", plot = FALSE)
# otros breaks: breaks = "scott", breaks = "fd" (freedman-diaconis)

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
# OPERACIONES ENTRE EVENTOS
# 🔹 Complemento: P(Aᶜ) = 1 - P(A)
# 🔹 Unión:       P(A ∪ B) = P(A) + P(B) - P(A ∩ B)
# 🔹 Intersección:
#       * Si A y B son independientes → P(A ∩ B) = P(A) * P(B)
# 🔹 Probabilidad condicional: 
#       P(A|B) = P(A ∩ B) / P(B)

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
# 7. Teorema de Bayes TEOREMA DE LA PROBABILIDAD TOTAL
###############################################################
# Si {B1, B2, ..., Bn} es una partición del espacio muestral S:
#
# 📌 P(A) = P(A ∩ B1) + P(A ∩ B2) + ... + P(A ∩ Bn)
#        = P(B1)P(A|B1) + P(B2)P(A|B2) + ... + P(Bn)P(A|Bn)
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

# ===========================================
# 10. Teorema de Probabilidad Total
# P(A) = P(A|B1) * P(B1) + P(A|B2) * P(B2) + ... + P(A|Bn) * P(Bn), donde "n" es el número de escenarios en la partición
# ==========================================
# Ejemplo en R
# Supongamos que una fábrica tiene dos máquinas:
##############################################
# PROBLEMA 1: MÁQUINAS Y PRODUCTOS DEFECTUOSOS
##############################################
# Una fábrica tiene dos máquinas:
# - La máquina 1 produce el 60% de los productos (P(B1) = 0.6).
#   Tiene un 2% de defectuosos (P(D|B1) = 0.02).
# - La máquina 2 produce el 40% de los productos (P(B2) = 0.4).
#   Tiene un 5% de defectuosos (P(D|B2) = 0.05).
#
# Usando el teorema de la probabilidad total:
# P(D) = P(D|B1)*P(B1) + P(D|B2)*P(B2)
#
# Además, se quiere calcular con Bayes:
# P(B1|D) = (P(D|B1)*P(B1)) / P(D)

# Probabilidades
P_B1 <- 0.6
P_B2 <- 0.4
P_D_given_B1 <- 0.02
P_D_given_B2 <- 0.05

# Teorema de probabilidad total
P_D <- P_D_given_B1 * P_B1 + P_D_given_B2 * P_B2

# Bayes: probabilidad de que el producto defectuoso venga de la máquina 1
P_B1_given_D <- (P_D_given_B1 * P_B1) / P_D


##############################################
# PROBLEMA 2: HOMBRES Y MUJERES FUMADORES
##############################################
# En una población:
# - El 48% son hombres (P(H) = 0.48)
# - El 52% son mujeres (P(M) = 0.52)
#
# Prevalencia de tabaquismo:
# - 25% de los hombres fuman (P(F|H) = 0.25)
# - 18% de las mujeres fuman (P(F|M) = 0.18)
#
# Usando el teorema de la probabilidad total:
# P(F) = P(F|H)*P(H) + P(F|M)*P(M)
#
# También se pide con Bayes:
# P(H|F) = (P(F|H)*P(H)) / P(F)

# Probabilidades
P_H <- 0.48
P_M <- 0.52
P_F_given_H <- 0.25
P_F_given_M <- 0.18

# Teorema de probabilidad total
P_F <- P_F_given_H * P_H + P_F_given_M * P_M

# Bayes: probabilidad de que un fumador sea hombre
P_H_given_F <- (P_F_given_H * P_H) / P_F
# ==========================================
