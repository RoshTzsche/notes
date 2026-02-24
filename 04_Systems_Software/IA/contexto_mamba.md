# Contextualización para agentes
### 📂 BITÁCORA DE PROYECTO: VISION LAB (System Log)

**HARDWARE (Host):**

* **Máquina:** Lenovo Legion 5 Pro (Gen 7).
* **CPU:** AMD Ryzen 7 6800H.
* **GPU de Cómputo:** NVIDIA GeForce RTX 3070 (Ampere). Driver Proprietario.
* **Pantalla:** WQXGA (16:10).
* **OS:** CachyOS (Arch-based) + Hyprland.
* **Shell:** Fish (Configurado con *Lazy Loading* para Conda vía función `IA_Mode`).

**STACK DE DESARROLLO (Architecture):**

* **Gestor de Paquetes:** Miniforge (Mamba 2.x).
* **Entorno Activo:** `vision` (Path: `/opt/miniforge/envs/vision`).
* **Editor/IDE:** Neovim + **Iron.nvim** (REPL directo al entorno). *No se usa Jupyter Notebook.*

**DEPENDENCIAS CRÍTICAS (Versiones Bloqueadas):**

* **Python:** 3.10 (Estabilidad).
* **CUDA Toolkit:** 11.8 (Compatibilidad estricta).
* **PyTorch:** Versión oficial con soporte CUDA (`pytorch-cuda=11.8` desde canales `-c pytorch -c nvidia`). *Fix aplicado: Evitar versión `cpu_mkl` de conda-forge.*
* **Libs Auxiliares:** OpenCV (`cv2`), Matplotlib, NumPy.

**ESTADO ACTUAL DEL PROYECTO:**

1. **Objetivo:** Aprendizaje de Visión Artificial desde las matemáticas (Bottom-Up). De Convoluciones manuales a YOLO.
2. **Hitos Completados:**
* Aislamiento de entorno exitoso.
* Verificación de Hardware: `torch.cuda.is_available()` retorna `True`. Multiplicación de tensores en GPU validada (~0.019s).
* Teoría: Comprensión de la imagen como Matriz y operación de Convolución (Filtros).
* Práctica: Implementación manual de **Filtro Sobel** (Detector de bordes) entendiendo la matemática de la resta de píxeles (Negativos/Positivos).

**PRÓXIMOS PASOS [roadmap-full](math/IA/roadmap-full.md):**

* Transición de filtros manuales (Sobel) a filtros aprendibles.
* Entender Pooling y Stride.
* Construir la primera CNN simple en PyTorch.

---
