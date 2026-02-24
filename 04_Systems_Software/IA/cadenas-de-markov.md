# Cadenas de Markov

El estado futuro depende solo del estado actual, no de la historia (Propiedad de Markov).
La propiedad de Markov es una simplificación necesaria

Para entender a fondo este intrincado sistema primero se deben dominar los siguientes temas:
1. Probabilidad condicional y el [teorema de Bayes](teorema-de-bayes.md)
    - Un Modelo de Markov se basa en inferir lo que no conoces a partir de lo que si puedes ver
   $$ P(A∣B)=P(B)P(B∣A)⋅P(A) $$

2. Propiedad de Markov, el sistema no tiene memoria mas allá del paso anterior
    $$ P(X_t+1|X_t) $$ 

## Hidden Markov Models HMM's 

