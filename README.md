# 🧠 My Integrated Engineering Vault

Welcome to my digital brain. This repository is a structured monorepo containing my journey through **Biomedical Engineering**, **Signal Processing**, and **Deep Learning**. 

> "Bridging the gap between biological neural networks and synthetic architectures."

---

## 🏗️ Repository Architecture
Inspired by the Zettelkasten method, this vault is organized by functional domains:

* **`01_Foundations/`**: The mathematical and chemical bedrock (Linear Algebra, Thermodynamics).
* **`02_Biomedical_Engineering/`**: Signal processing labs (MIT 6.007) and physiological modeling.
* **`03_Intelligence_Lab/`**: Computer Vision (Stanford CS231n) and Neural Network implementations.
* **`04_Systems_Software/`**: Low-level programming, Python toolkits, and Linux optimization.
* **`05_Archive_Personal/`**: Literature, philosophy, and personal logs.

---

## 🔬 Current Research & Learning
I am currently focusing on the foundation of signal processing, and the extraction of features from EEG signals.

### Signal Processing Focus
To isolate the **Mu-rhythm** ($\mu \approx 10\text{Hz}$) from environmental noise, I am implementing digital IIR filters. The goal is to maximize the Signal-to-Noise Ratio (SNR):

$$SNR = 10 \log_{10} \left( \frac{P_{signal}}{P_{noise}} \right)$$

### Computer Vision (Stanford CS231n)
Implementing CNN architectures to classify biological imaging data, focusing on backpropagation and gradient descent optimization.

---

## 🛠️ Tech Stack & Environment
- **OS**: CachyOS (Linux)
- **Kernel**: Optimized for low-latency signal processing.
- **Languages**: Python (NumPy, Scipy, PyTorch), Bash.

---

## 📈 Roadmap
- [x] Migrate notes to functional structure.
- [ ] Implement a real-time Notch Filter for 60Hz noise.
- [ ] Build a CNN-based classifier for Motor Imagery.
- [ ] Integrate with Hyprland via `hyprctl` for BCI-based workspace switching.

---
*by Rosh | Biomedical Engineering Student*
