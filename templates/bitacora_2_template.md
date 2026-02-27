/====================================================================\
| >> SESSION [ID]: {{title}}                                         |
| >> Status:       {{fresco}}                                        |
|--------------------------------------------------------------------|
| @ Date: {{date}}                      @ Time: {{time}}             |
\====================================================================/
---
/====================================================================\
# title
\====================================================================/

### 0. FAST RECAP
*Summary for my future self after a week of not sleeping.*
* **The "What":** (One sentence summary of the core concept)
* **The "So What":** (Why does this matter for Biomedical Engineering?)
* **The "How":** (The dominant mathematical tool used)

---

### 1. ATOMIC SYNTHESIS (Zettelkasten)
*Link everything.*
* **Core Concept:** [[[[Concept Name]]]]
    Definition (short):
* **Bio-Link:** How does [[[[Visual Physiology]]]] or [[[[Medical Imaging]]]] relate to this?
    Answer:
* **Mental Model:** (e.g., "Convolutions are just sliding dot products that act as feature filters").
    
---

### 2. THE MATHEMATICAL ENGINE

**Fundamental Equation:**
$$

$$

**Variable Breakdown & Constraints:**
* $x_i$: Input data (e.g., Pixel intensities of a [[[[Blood Smear]]]] image).
* $W$: Weights (The "knowledge" being optimized).
* $\lambda R(W)$: Regularization penalty to prevent **Overfitting**.

---

### 3. IMPLEMENTATION & FRICTION
*Focus on the 'venv' safety and architectural logic.*

**Logic Flow:**
1. Initialize weights using [[[[Xavier/He Initialization]]]].
2. Forward pass: $score = Wx$.
3. Compute loss and backpropagate gradients.

**Friction Log:**
* **Error:** `RuntimeError: Expected 4D tensor but got 3D.`
* **The "Aha!" Moment:** Forgot the batch dimension for a single image input. Use `img.unsqueeze(0)`.

---

### 4. BIOMEDICAL CONTEXT (The ROI)
*Applying theory to my actual research.*
* **Target Data:** (e.g., [[[[Cell Morphology Analysis]]]]).
* **The Translation:** "The edge detection discussed in Lecture 1 is exactly what I need to segment the borders of leukocytes in my current project."

---

### 5. ACTIVE RECALL (The Self-Exam)
*Questions for the next time I open this file.* - Gemini
1. Why did the 'Generalized Cylinder' model fail to scale for complex natural images?
2. Mathematically, how does a GPU outperform a CPU in matrix multiplication for CNNs?
3. [ ] **Spaced Repetition Check:** Did I review [[[[Session ID-1]]]]?

---
# Tech due 
- [ ] Understanding the Jacobian matrix in high-dimensional backprop.

