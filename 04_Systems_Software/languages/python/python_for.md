## Punteros vs objetos
Debatiendo con un agente acerca de un código que usa bucles for, sugirió el uso de orientación a objetos

Yo intentaba hacer el bucle con un apuntador de la forma:
'''

for i in range(jeringas)
    jeringa[i].usar() 
'''
pero la forma pytonica y correcta es \

'''
for jeringas in jeringas
    jeringa.usar

'''
El agente lo explico de una muy buena manera, el hecho de porque la forma pytonica es más eficiente que la mía (apuntador)

### Metafora de bioquímica
Tu cuerpo no replica el ADN contando nucleótidos desde el principio ("Nucleótido 1, Nucleótido 2..."). La enzima se ancla a la cadena y avanza al siguiente bloque físico.

    Si la ADN polimerasa tuviera que calcular la posición [i] relativa al inicio para cada base del genoma (3 mil millones), la replicación sería eterna.

    Lección: Trabajar con el flujo local es más robusto que depender de coordenadas globales

### Comparación de Complejidad Interna:

    Tu método (range):
    Costo=N×(Generar i+Verificar lıˊmites+Buscar direccioˊn+Recuperar objeto)

    Método Python (iterador):
    Costo=N×(Recuperar "Siguiente" objeto)

### El riesgo de "Desincronización" (Index Out of Bounds)

Si por alguna razón filtras tu lista ax (ej. eliminas un gráfico dañado) pero tu rango range(6) sigue fijo, tu código explotará (IndexError). El iterador directo es auto-ajustable. Solo recorre lo que existe.



