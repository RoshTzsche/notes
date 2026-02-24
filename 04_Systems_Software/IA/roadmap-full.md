# EL PROTOCOLO TURING: Roadmap de Ingeniería de Visión Artificial (First-Principles Approach)

> **Objetivo Final:** Dominio estructural de la Visión Artificial, desde la física de la señal hasta la generación semántica (IA Generativa), priorizando la implementación matemática sobre el uso de librerías de "caja negra".

Los Activos (Links)

    La Clase (Video):

        Fuente: YouTube - CS231n Winter 2017 (Karpathy & Fei-Fei Li).

        Enlace: CS231n 2017 Playlist

        Instrucción: Empieza por la Lecture 1 hoy mismo.

    El Syllabus y Tareas (Archivo):

        Fuente: Stanford Archive 2017.

        Enlace: CS231n 2017 Syllabus & Slides

        Instrucción: Aquí descargarás los PDFs de las slides y, crucialmente, las Assignments.

    El Código de las Tareas (GitHub):

        Las tareas originales requieren configurar entornos viejos. Usa este repositorio que suele estar actualizado para correr en Python 3 moderno sin romper todo:

        Busca en GitHub: cs231n assignments 2023 (La matemática no cambia, el código base sí). O intenta ejecutar los originales de 2017 y arregla los errores de importación (buen ejercicio de depuración).
El Algoritmo de Solución: Ejecución "Just-in-Time"

Vas a invertir el orden. CS231n es tu hilo conductor. Los cursos del MIT son tus enciclopedias de consulta, no tu tarea diaria.

P1: El Motor Principal (CS231n)

    Acción: Empieza el curso de Stanford YA.

    Tu Misión: Llegar a la Lecture 5: Convolutional Neural Networks.

    El "Hack": No uses el material de 2016 si puedes evitarlo; busca la versión 2017 o las notas actualizadas, pero la pedagogía de Karpathy es insuperable.

    Entregable: Haz el "Assignment 1" (kNN, SVM, Softmax). Aquí te estrellarás con NumPy. Eso es bueno.

P2: Inyección Quirúrgica de Oppenheim (6.007)

    Solo cuando llegues a la palabra "Convolución" en CS231n, detente.

    Ve a MIT RES.6-007. Mira SOLO las clases sobre Convolución y Filtros.

        Entiende que una convolución es "invertir y desplazar" (flip and drag).

        Aplicación Biomédica: Si trabajas con ECG (1D), la convolución es cómo filtras el ruido de la línea base. Si trabajas con Rayos X (2D), es cómo detectas bordes.

        Nota: Ignora la Transformada Z y Laplace por ahora. Son vitales para control, pero secundarias para Visión Artificial inicial.

P3: Dosis Mínima Viable de Probabilidad (6.041)

    Cuando en CS231n veas la función Softmax o Cross-Entropy Loss.

    Ve a 6.041 o busca el concepto específico: "Maximum Likelihood Estimation" (MLE).

    Entiende que entrenar una red es simplemente ajustar una distribución de probabilidad a tus datos.
El Algoritmo de Ejecución Diaria (Tu "Loop Principal")

Tu cerebro buscará la ruta de menor resistencia (ver videos acostado). Prohibido. Tu rutina diaria debe seguir este ciclo estricto de Input -> Proceso -> Output.

Tiempo Estimado Diario: 2 - 3 Horas (Bloque ininterrumpido).
1. Input: Ingesta Activa (45 min)

    Pon el video a velocidad 1.25x o 1.5x.

    Regla de Oro: Si Karpathy escribe algo en la pizarra o muestra una fórmula en la slide, tú la copias a mano en un cuaderno.

    No captures pantalla. La escritura manual conecta la corteza visual con la motora, forzando la atención.

2. Proceso: La Transliteración (60 min) - Aquí muere el Vibe Coding

    Abre tu entorno (VS Code/Jupyter).

    No mires la solución.

    Toma la fórmula matemática explicada en clase (ej. L2 Distance o Hinge Loss).

    Impleméntala en NumPy puro.

        Prohibido usar: torch.nn, sklearn, o Copilot.

        Objetivo: Entender cómo las matrices se multiplican y suman "debajo del capó".

3. Output: El "Check" Biomédico (30 min)

    Aplica ese concepto simple a un dato médico.

    Ejemplo para Clase 2 (kNN): Descarga un dataset de clasificación de células sanguíneas o ECGs simples.

    Usa tu implementación de NumPy para clasificar ese dato.

    ¿Funciona horrible? Bien. Entiende por qué. (Spoiler: Los píxeles crudos son pésimos features).

Tu Tarea Inmediata (Hoy/Mañana)

Objetivo: Completar el Assignment 1: k-Nearest Neighbor (kNN).

    Descarga el Assignment 1.

    El notebook te pedirá implementar compute_distances_two_loops.

        Significa usar dos bucles for para calcular la distancia entre cada imagen de test y cada imagen de train.

        Hazlo. Verás que es lentísimo.

    Luego te pedirá compute_distances_no_loops (Vectorización).

        Aquí es donde sufrirás. Tienes que usar broadcasting de NumPy.

        Esta es la prueba de fuego. Si logras vectorizar la distancia L2 sin usar bucles, habrás recuperado el 10% de tu alma de programador.

La Autopsia del Error de Juicio

    Disonancia Dimensional:

        CS231n: Trabaja con imágenes (Tensores 3D aplanados).

        Biomedicina: Un ECG es una serie de tiempo (1D). Una resonancia magnética es un volumen (3D real). Si le metes un ECG a tu script sin adaptar las dimensiones (reshape), Python te escupirá un error de Broadcasting o, peor aún, calculará distancias sin sentido.

    La Falacia de la Distancia Euclidiana (L2):

        Tu script calcula la distancia física entre píxeles.

        En señales fisiológicas, dos latidos idénticos pero desplazados por 0.1 segundos tendrán una distancia Euclidiana enorme (error alto), aunque clínicamente sean iguales.

        Riesgo: Tu script dirá que el paciente está enfermo cuando solo tiene el ritmo cardíaco desfasado.

    Ceguera de Escala:

        Los píxeles van de 0 a 255. Las señales de voltaje de un EEG van en microvoltios (μV). Si mezclas escalas o no normalizas, la matemática se rompe.

El Algoritmo de Solución: Adaptación, no Repetición

Para que la "Aplicación Biomédica" cuente como ingeniería y no como juego, debes hacer esto:

P1: Ingesta y Adaptación de Datos (Data Munging)

    No puedes simplemente cambiar la ruta del archivo.

    Debes escribir un cargador (dataloader) que tome tus datos médicos (ej. archivo .csv o .dcm) y los transforme al formato que espera tu función compute_distances: una matriz NumPy de forma (N,D).

        N: Número de muestras (pacientes/latidos).

        D: Dimensiones (puntos de tiempo o píxeles).

P2: El Test de Sanidad (Sanity Check)

    Antes de confiar en el resultado, visualiza.

    Si tu kNN dice que el "Vecino más cercano" de un latido normal es una arritmia ventricular, tu métrica de distancia (L2) es inútil para este tipo de dato.

    Eso es la ingeniería: Darse cuenta de que la herramienta (L2) quizás no sirve para el problema (Series de Tiempo) y anotar eso en tu bitácora.

Tu Tarea Real: Cuando termines el script de kNN para imágenes:

    Consigue MNIST (dígitos escritos a mano) o un dataset simple de ECG (ej. MIT-BIH Arrhythmia Database, solo una clase).

    Fuerza tus datos médicos a entrar en la matriz (N,D).

    Ejecuta el script.

    Analiza: ¿Tiene sentido el resultado o es ruido?
---

## NIVEL 0: El Sustrato Físico (Signal Processing)
**Estado:** *En Progreso* | **Enfoque:** Determinista

Antes de que una IA pueda "ver", debes entender qué es lo que está mirando. Una imagen digital no es la realidad; es una aproximación discreta y cuantizada de una señal continua de luz. Si ignoras esto, tus modelos fallarán ante ruido, aliasing y artefactos de compresión.

### 1.1 Teoría de [Señales y sistemas](math/IA/señales-y-sistemas.md)
* **El "Por Qué":** Las redes neuronales modernas (CNNs) son sistemas de procesamiento de señales no lineales. La convolución, el pooling (submuestreo) y los filtros son conceptos robados de la ingeniería eléctrica de 1950.
* **Recurso Primario:** [MIT RES.6-007: Signals and Systems (Alan Oppenheim)](https://www.youtube.com/playlist?list=PLQbUiAH8rS6Yd6JvFv5Cg8qOqI8M6Y6q_)
* **Conceptos Críticos:**
    * **Convolución (LTI Systems):** La operación atómica de la visión. Entenderla como "flip & drag".
    * **Transformada de Fourier (CTFT/DTFT/DFT):** Descomposición de señales en frecuencias. En imágenes, los bordes son "alta frecuencia" y los colores planos son "baja frecuencia".
    * **Teorema de Muestreo (Nyquist-Shannon):** Por qué el redimensionamiento de imágenes sin filtrado previo destruye información (Aliasing).
* **Entregable de Código (Python/NumPy):**
    * [ ] Implementar `mi_convolucion_2d(imagen, kernel)` usando bucles for (para sentir el dolor $O(N^2)$) y luego vectorizado.
    * [ ] Crear un filtro "Pasa Bajas" en el dominio de la frecuencia usando FFT manual para quitar ruido de una imagen.

### 1.2 El Eslabón Perdido: Probabilidad y Estocasticidad
* **El "Por Qué":** El mundo real es ruidoso e incierto. El Aprendizaje Automático (ML) es simplemente Estadística Computacional. Necesitas cuantificar la incertidumbre.
* **Recurso Primario:** [MIT 6.041: Probabilistic Systems Analysis (John Tsitsiklis)](https://ocw.mit.edu/courses/6-041-probabilistic-systems-analysis-and-applied-probability-fall-2010/)
* **Conceptos Críticos:**
    * **Teorema de Bayes:** La base de la inferencia. $P(Hipotesis|Datos)$.
    * **Esperanza y Varianza:** Para entender las funciones de pérdida (Loss Functions) y el ruido en los gradientes.
    * **Distribuciones (Gaussiana/Bernoulli):** Inicialización de pesos en redes neuronales.
* **Entregable de Código:**
    * [ ] Simulador de Monte Carlo para estimar $\pi$ o resolver un problema de probabilidad contraintuitivo.

---

## NIVEL 1: Visión Clásica & Geometría Proyectiva (The "Old School")
**Estado:** *Pendiente* | **Enfoque:** Geométrico / Analítico

Aquí aprendemos a procesar imágenes usando matemática explícita, sin "entrenar" nada. Esto te da la intuición espacial que le falta a la mayoría de los ingenieros de Deep Learning.

### 2.1 Geometría de la Formación de Imágenes
* **El "Por Qué":** Una foto es una proyección 3D $\to$ 2D. Perder una dimensión crea ambigüedad. Para medir distancias o reconstruir objetos (3D Vision), necesitas invertir esta proyección.
* **Recurso Primario:** Libro *"Computer Vision: Algorithms and Applications"* (Szeliski) + [Georgia Tech CS 6476](https://omscs.gatech.edu/cs-6476-computer-vision)
* **Conceptos Críticos:**
    * **Modelo Pinhole:** Matrices de cámara (Intrínsecas $K$ / Extrínsecas $[R|t]$).
    * **Transformaciones Proyectivas:** Homografías. Cómo rotar y rectificar imágenes.
    * **Epipolar Geometry:** Cómo funcionan dos ojos (estéreo) para calcular profundidad.
* **Entregable de Código:**
    * [ ] Crear un "Panorama Stitcher": Tomar 3 fotos y unirlas en una sola imagen panorámica usando homografías calculadas manualmente (SVD).

### 2.2 Features Artesanales (Feature Engineering)
* **El "Por Qué":** Antes de las redes neuronales, los ingenieros diseñaban detectores de bordes y esquinas a mano. Entender SIFT o HOG te enseña qué es lo que "busca" una red neuronal.
* **Conceptos Críticos:**
    * **Gradientes de Imagen:** Sobel, Canny Edge Detector.
    * **Descriptores:** Histogramas de gradientes orientados.

---

## NIVEL 2: Machine Learning Clásico (El Puente)
**Estado:** *Pendiente* | **Enfoque:** Estadístico / Optimización

Dejamos de programar las reglas y empezamos a programar sistemas que *encuentran* las reglas.

### 3.1 Teoría del Aprendizaje
* **El "Por Qué":** ¿Cómo sabemos que el modelo funcionará con datos que nunca ha visto?
* **Recurso Primario:** *"Learning From Data"* (Yaser Abu-Mostafa, Caltech).
* **Conceptos Críticos:**
    * **Bias-Variance Tradeoff:** El dilema eterno entre memorizar (Overfitting) y generalizar poco (Underfitting).
    * **Descenso del Gradiente:** El motor de optimización de toda la IA moderna.
* **Entregable de Código:**
    * [ ] Implementar Regresión Logística y una SVM simple desde cero (usando solo NumPy) para clasificar dígitos del dataset MNIST.

---

## NIVEL 3: Deep Learning & Computer Vision (La Convergencia)
**Estado:** *Pendiente* | **Enfoque:** Diferenciable / Data-Driven

Aquí fusionamos Señales (Convolución) con Aprendizaje (Backpropagation). Es el estándar actual de la industria.

### 4.1 Redes Neuronales Convolucionales (CNNs)
* **El "Por Qué":** Las CNNs imponen un "prior" arquitectónico: asumen que si un gato está en la esquina superior izquierda, es el mismo gato que si estuviera en la esquina inferior derecha (Invarianza traslacional).
* **Recurso Primario:** [Stanford CS231n: Convolutional Neural Networks for Visual Recognition](http://cs231n.stanford.edu/) (Versión Karpathy/Fei-Fei Li).
* **Conceptos Críticos:**
    * **Backpropagation:** La regla de la cadena en esteroides.
    * **Arquitecturas:** AlexNet, ResNet (Skip Connections), U-Net (Segmentación).
    * **Regularización:** Dropout, Batch Normalization.
* **Entregable de Código (El "Boss Fight"):**
    * [ ] Escribir una librería de Deep Learning mini modular (capas Linear, Conv2d, ReLU, Softmax) que haga backpropagation automático sin usar PyTorch/TensorFlow.

### 4.2 Frameworks Modernos
* **Recurso:** Documentación oficial de PyTorch.
* **Acción:** Re-implementar todo lo anterior usando PyTorch, enfocándose en la carga de datos eficiente (DataLoaders) y entrenamiento en GPU.

---

## NIVEL 4: La Frontera (State of the Art)
**Estado:** *Futuro* | **Enfoque:** Generativo / Multimodal

Donde la visión se encuentra con el lenguaje y la generación.

### 5.1 Transformers en Visión (ViT)
* **Concepto:** Reemplazar la inductancia local de la convolución con la "Atención Global".
* **Paper:** *"An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale"*.

### 5.2 Modelos Generativos
* **Concepto:** Aprender la distribución de probabilidad de los datos para generar muestras nuevas.
* **Tecnologías:** Stable Diffusion (Latent Diffusion Models), VAEs.
* **Matemática:** Cadenas de Markov, Ecuaciones Diferenciales Estocásticas (para Difusión).

---

## METODOLOGÍA DE ESTUDIO ("The Turing Protocol")

1.  **Iteración Rápida:** No pases más de 2 días solo leyendo teoría.
2.  **Transliteración de Código:**
    * Leer la ecuación matemática.
    * Traducirla a Python (`numpy`) plano.
    * Verificar que la salida coincida con la teoría.
3.  **Proyectos "Full Stack":** No entregues solo un script. Entrega un pipeline:
    * Carga de Datos -> Preprocesamiento (Oppenheim) -> Modelo (ML) -> Evaluación (Estadística) -> Visualización.
