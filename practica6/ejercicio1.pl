/*
        EJERCICIOS DE RECURSIVIDAD EN PROLOG:

- Describir la disposición de los objetos de la figura usando hechos como
derecha_de(llave, tortuga) y encima_de(coche, tortuga)
<< derecha_de significa inmediatamente a la derecha de y encima_de significa 
inmediatamente encima de>>
- Definir los predicados izquierda_de y debajo_de en términos de los anteriores
(derecha_de y encima_de).
*/

debajo_de(coche, bombilla).
debajo_de(tortuga, coche).
debajo_de(cafe, lupa).
debajo_de(semaforo, cafe).
debajo_de(martillo, peso).
debajo(X, Y) :- debajo_de(X, Y).
debajo(X, Y) :- debajo_de(X, Z),
                debajo(Z, Y).

encima_de(X, Y) :- debajo_de(Y, X).
encima(X, Y) :- encima_de(X, Y).
encima(X, Y) :- encima_de(X, Z),
                encima(Z, Y).

derecha_de(llave, tortuga).
derecha_de(semaforo, llave).
derecha_de(martillo, semaforo).
derecha_de(peso, cafe).
derecha(X, Y) :- derecha_de(X, Y).
derecha(X, Y) :- derecha_de(X, Z),
                 derecha(Z, Y).

izquierda_de(X, Y) :- derecha_de(Y, X).
izquierda(X, Y) :- izquierda_de(X, Z),
                   izquierda(Z, X).


