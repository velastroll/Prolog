encima_de(bombilla, coche).
encima_de(coche, tortuga).
encima_de(taza, semaforo).
encima_de(lupa, taza).
encima_de(peso, martillo).
encima(X, Y):-encima_de(X, Y).
encima(X, Y):-encima_de(X, X1), encima(X1, Y).

derecha_de(llave, tortuga).
derecha_de(semaforo, llave).
derecha_de(martillo, semaforo).
derecha(X, Y):-derecha_de(X, Y).
derecha(X, Y):-derecha_de(X, X1), derecha(X1, Y).

izquierda_de(X, Y):- derecha_de(Y, X).
izquierda(X, Y):- izquierda_de(X, Y).
izquierda(X, Y):- izquierda_de(X, X1), izquierda(X1, Y).

debajo_de(X, Y):- encima_de(Y, X).
debajo(X, Y):- debajo_de(X, Y).
debajo(X, Y):- debajo_de(X, X1), debajo(X1, Y).