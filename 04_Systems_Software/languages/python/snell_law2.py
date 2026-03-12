import numpy as np

def calcular_refraccion ( n1 , n2 , theta1 ) :
    # Despeje algebraico de la Ley de Snell
    valor_seno = ( n1 / n2 ) * np . sin ( theta1 )

# Manejo de dominio real : Reflexion Total Interna
    if valor_seno > 1.0 or valor_seno < -1.0:
        return None # El vector no traspasa la frontera

    theta2 = np.arcsin (valor_seno)
    return theta2

resultado = calcular_refraccion(1,0.9,60)
print(resultado)
