import numpy as np
import matplotlib.pyplot as plt
from matplotlib.widgets import Slider

def calculate_phi_wilke(mu, M):
    """
    Calculates the binary interaction parameters phi_ij using the Wilke method.
    
    Arguments:
        mu: Array of pure component viscosities [mu_1, mu_2, ..., mu_n]
        M:  Array of molecular weights [M_1, M_2, ..., M_n]
        
    Returns:
        phi: Matrix of shape (n, n) where phi[i, j] is the interaction parameter.
    """
    # Vectorized calculation using broadcasting
    # n is number of components
    n = len(mu)
    
    # Reshape for broadcasting: i is row (n, 1), j is col (1, n)
    mu_i = mu[:, np.newaxis]
    mu_j = mu[np.newaxis, :]
    M_i = M[:, np.newaxis]
    M_j = M[np.newaxis, :]
    
    # Wilke formula
    # numerator = (1 + (mu_i/mu_j)^0.5 * (M_j/M_i)^0.25)^2
    term1 = (mu_i / mu_j)**0.5
    term2 = (M_j / M_i)**0.25
    numerator = (1 + term1 * term2)**2
    
    # denominator = sqrt(8 * (1 + M_i/M_j))
    denominator = np.sqrt(8 * (1 + M_i / M_j))
    
    phi = numerator / denominator
    return phi

def calculate_k_wms(y, k_pure, phi):
    """
    Calculates Mixture Thermal Conductivity using Wassiljewa-Mason-Saxena equation.
    
    Formula: k_mix = Sum( (y_i * k_i) / Sum(y_j * phi_ij) )
    
    Arguments:
        y:      Composition array of shape (N_points, n_components)
        k_pure: Pure component thermal conductivities of shape (n_components,)
        phi:    Interaction parameter matrix of shape (n_components, n_components)
        
    Returns:
        k_mix: Array of mixture thermal conductivities of shape (N_points,)
    """
    # Denominator term: Sum(y_j * phi_ij) for each component i
    # Result is shape (N_points, n_components)
    # We use matrix multiplication: y @ phi.T 
    # (N, n) @ (n, n) -> (N, n)
    denominator = y @ phi.T
    
    # Numerator term: y_i * k_i
    # Broadcasting k_pure across N_points
    numerator = y * k_pure[np.newaxis, :]
    
    # Sum over components i
    k_mix = np.sum(numerator / denominator, axis=1)
    
    return k_mix

# --- Data Simulation (Hydrogen + Nitrogen) ---
# Approximate power-law dependencies for gas properties
# H2 (Component 1)
M1 = 2.016   # g/mol
def get_props_H2(T):
    # k in W/mK, mu in Pa.s
    # Reference values approx at 300K extrapolated
    k = 0.1805 * (T / 300)**0.75 
    mu = 8.8e-6 * (T / 300)**0.7
    return k, mu

# N2 (Component 2)
M2 = 28.013  # g/mol
def get_props_N2(T):
    k = 0.0260 * (T / 300)**0.8
    mu = 1.78e-5 * (T / 300)**0.7
    return k, mu

# --- Setup Interactive Plot ---

# 1. Generate Composition Vector (0 to 1 Mole Fraction of H2)
N_points = 100
y1 = np.linspace(0, 1, N_points)
y2 = 1 - y1
# Stack into (N, 2) matrix
Y = np.vstack((y1, y2)).T

# Molecular Weights Vector
M = np.array([M1, M2])

# Initial Temperature
T_init = 300.0

# Create Figure
fig, ax = plt.subplots(figsize=(10, 6))
plt.subplots_adjust(bottom=0.25) # Make room for slider

# Initial Calculation
k1, mu1 = get_props_H2(T_init)
k2, mu2 = get_props_N2(T_init)

k_pure = np.array([k1, k2])
mu_pure = np.array([mu1, mu2])
phi_init = calculate_phi_wilke(mu_pure, M)
k_mix_init = calculate_k_wms(Y, k_pure, phi_init)

# Plot Initial Data
line, = ax.plot(y1, k_mix_init, lw=2.5, color='#1f77b4', label='WMS Model')

# Decoration
ax.set_title(f"Gas Mixture Thermal Conductivity (WMS Method)\nBinary Mixture: H$_2$ - N$_2$", fontsize=14)
ax.set_xlabel("Mole Fraction Hydrogen ($y_{H_2}$)", fontsize=12)
ax.set_ylabel("Thermal Conductivity ($W \cdot m^{-1} \cdot K^{-1}$)", fontsize=12)
ax.set_ylim(0, 0.35)
ax.grid(True, linestyle='--', alpha=0.6)
ax.legend()

# Add Text Annotation for Current T
text_box = ax.text(0.05, 0.9, f"T = {T_init:.0f} K", transform=ax.transAxes, 
                   fontsize=12, bbox=dict(facecolor='white', alpha=0.8))

# --- Slider Logic ---
ax_temp = plt.axes([0.2, 0.1, 0.60, 0.03], facecolor='lightgoldenrodyellow')
slider_temp = Slider(
    ax=ax_temp,
    label='Temperature (K)',
    valmin=200,
    valmax=1000,
    valinit=T_init,
    valstep=10
)

def update(val):
    T_curr = slider_temp.val
    
    # 1. Update Pure Component Properties based on T
    k1_new, mu1_new = get_props_H2(T_curr)
    k2_new, mu2_new = get_props_N2(T_curr)
    
    k_pure_new = np.array([k1_new, k2_new])
    mu_pure_new = np.array([mu1_new, mu2_new])
    
    # 2. Re-calculate Interactions (Phi)
    # Note: Phi changes because viscosity ratio changes with T
    phi_new = calculate_phi_wilke(mu_pure_new, M)
    
    # 3. Re-calculate Mixture Conductivity
    k_mix_new = calculate_k_wms(Y, k_pure_new, phi_new)
    
    # 4. Update Plot
    line.set_ydata(k_mix_new)
    text_box.set_text(f"T = {T_curr:.0f} K")
    
    # Rescale Y-axis dynamically if needed
    # ax.set_ylim(0, max(k_mix_new)*1.1)
    
    fig.canvas.draw_idle()

slider_temp.on_changed(update)

plt.show()
