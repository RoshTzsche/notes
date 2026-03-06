import numpy as np 
import matplotlib.pyplot as plt 
x = np.linspace(-1,1,10000)
f = 3*x**2 + 1
g = x**3 + x

plt.plot(x,f,"r-")

plt.plot(x,g,"b-")
plt.plot(x,0,"g-")


plt.grid()
plt.show()

