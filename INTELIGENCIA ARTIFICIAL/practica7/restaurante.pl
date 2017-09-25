/*        RESTAURANTE           */	

/* menu */

entrada(paella).
entrada(gazpacho).
entrada(consome).

carne(filete_de_cerdo).
carne(pollo_asado).

pescado(trucha).
pescado(bacalao).

postre(flan).
postre(nueces_con_miel).
postre(naranja).

/*Valor calorico de una ración*/

calorias(paella, 200).
calorias(gazpacho, 150).
calorias(consome, 300).
calorias(filete_de_cerdo, 400).
calorias(pollo_asado, 280).
calorias(trucha, 160).
calorias(bacalao, 300).
calorias(flan, 200).
calorias(nueces_con_miel, 500).
calorias(naranja, 50).

/* plato_principal(P) P es un plato principal si es carne o pescado */

plato_principal(P):- carne(P).
plato_principal(P):- pescado(P).

/* comida(Entrada, Principal, Postre) */

comida(Entrada, Principal, Postre):-
        entrada(Entrada),
        plato_principal(Principal),
        postre(Postre).
    
/* Valor calorico de una comida */

valor(Entrada, Principal, Postre, Valor):-  
        entrada(Entrada),               /* edit (a) */
        calorias(Entrada, X),
        plato_principal(Principal),     /* edit (a) */
        calorias(Principal, Y),
        postre(Postre),                 /* edit (a) */
        calorias(Postre, Z),
        sumar(X, Y, Z, Valor).

/* Comida_equilibrada(Entrada, Principal, Postre) */

comida_equilibrada(Entrada, Principal, Postre):-
        comida(Entrada, Principal, Postre),
        valor(Entrada, Principal, Postre, Valor),
        menor(Valor, 600).


/* Conceptos auxiliares */

sumar(X, Y, Z, Res):-
        Res is X + Y + Z.             /* El predicado "is" se satisface si Res se puede unificar
                                       con el resultado de evaluar la expresión X + Y + Z */
menor(X, Y):- 
        X < Y.                        /* "menor" numérico*/

dif(X, Y):-
        X =\= Y.                      /* desigualdad numérica */

/* a) Formular las siguientes preguntas en Prolog.
 ¿Cuáles son las comidas que tienen consomé en la entrada?
        > ?- comidas(consome, Principal, Postre).
 ¿Cuáles son las comidas equilibradas que tienen naranja como postre?
        > ?- comida_equilibrada(Entrante, Principal, naranja).
 ¿Cuáles son las comidas que tienen un valor calórico de 500 calorías?
        > ?- valor(Entrada, Principal, Postre, 500).
 Si hay algún problema con la pregunta anterior, ¿Cómo lo arreglarías? >
        > Editando el algoritmo de Valor(_,_,_,_).

 b) Completar el programa anterior de forma que cada comida esté formada también por la
 elección de una bebida, a elegir entre vino, cerveza o agua mineral.  */

 bebida(vino).
 bebida(cerveza).
 bebida(agua).

 comida(Entrada, Principal, Postre, Bebida):-
        entrada(Entrada),
        plato_principal(Principal),
        postre(Postre),
        bebida(Bebida).
