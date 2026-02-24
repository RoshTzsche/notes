import numpy as np 
import matplotlib.pyplot as plt 
x = np.linspace(-1,1,10000)
f = x**2 + 2*x - 1
g = (1-x**2)/2

plt.plot(x,f,"r-")

plt.plot(x,g,"b-")
plt.plot(x,x,"g-")


plt.grid()
plt.show()

