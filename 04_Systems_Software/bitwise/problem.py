'''> Question 1: MissingNumber
You are given all numbers between 1, 2, …, n except one. Your task is to find the missing number.

Input:
The first input line contains an integer n.
The second line contains n−1 numbers. Each number is distinct and between 1 and n (inclusive).

Output:
Print the missing number.

Example:
Input: 2 3 1 5
Output: 4
'''
import numpy as np
n = 7
a = [1,2,3,5,6,7,8]
array = np.array(a)

esperado = (n*(n+1))/2

print("valor esperado" + str(esperado))

suma = np.sum(array)
suma_2 = 0

for i, array in enum(array):
    suma_2 = array[i] + suma_2


x = abs(esperado - suma)
print(str(x))

x_2 = abs(esperado - suma_2)
print(str(x_2))


