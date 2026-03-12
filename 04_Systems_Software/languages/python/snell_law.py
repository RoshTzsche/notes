import matplotlib . pyplot as plt

# Definicion del vector en el plano cartesiano
x = [0,5]
y = [0,3]

plt.plot(x, y, color = "red" , linewidth=2)
plt.xlabel( " Eje X ( mm ) " )
plt.ylabel( " Eje Y ( mm ) " )
plt.title( "Proyeccion Lineal de un Fotón" )
plt.grid( True )
plt.show()
