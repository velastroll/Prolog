/********************************/
/*     EJERCICIOS DE LISTAS     */
/*                              */
/*   @author t.me/Velastroll    */
/********************************/

concatenar([], L, L).
concatenar([Head|Tail], List, [Head|Return]):-
    concatenar(Tail, List, Return).


/* 1 - Determina si lo que hay es una lista */
es_lista([]):-!.
es_lista([Cabeza|Cola]) :- es_lista(Cola).

/* 2 - Calcula la longitud de una lista */
longitud([], S) :- S=0.
longitud([Cabeza|Cola], Solucion) :-
                                longitud(Cola, T),
                                Solucion is T+1.

/* 3 - Sumar los elementos de una lista */
sumar_elementos([], Solucion) :- 
                                Solucion = 0.
sumar_elementos([Cabeza|Cola], Solucion) :-
                                sumar_elementos(Cola, S2),
                                Solucion is Cabeza + S2.

/* 4 - Borrar un elemento X de la lista */
/*  Insertamos la cabeza en la salida   */
eliminar_x([Cabeza|Cola], Cabeza, Cola).
eliminar_x([Cabeza|Cola], X, [Cabeza|Salida]) :-
                            eliminar_x(Cola, X, Salida).

/* 5 - Insertar un elemento X en una lista , en cualquier posicion */


/*6 -   a) Descomponer una lista en dos. Mostrar todas las posibilidades
        b) Eliminar todos los elementos que siguen a 'z,z,z' y estos incluidos.
        c) Borrar los tres últimos elementos de una lista.
        d) Definir de nuevo la operación miembro a partir de concatenar.
        e) Definir la relación para extraer el último elemento de la lista:
            e.1) Utilizando la definición de concatenación.
            e.2) Sin utilizarla.        */
/* A - No funciona */
descomponer([Xs|Ys],Xs,Ys).
descomponer([],[],[]).
descomponer([As|Bs],[As|Xs],B):-descomponer(Bs,Xs,B).
/* B */
eliminar_XXX([X, Y, Z|Cola],[X,Y,Z], Salida):-
                                        Salida = [].
eliminar_XXX([Cabeza|Cola], [X, Y, Z], [Cabeza|Salida]) :-
                                        eliminar_XXX(Cola, [X, Y, Z], Salida).
/* C */
eliminar3ultimos([X], []):-!.
eliminar3ultimos([X, Y], []):-!.
eliminar3ultimos([X, Y, Z], []):-!.
eliminar3ultimos([Head|Tail], [Head|Return]):-
                                eliminar3ultimos(Tail, Return).
/* D */
miembro(Member, [Member|List]):-!.
miembro(Member, [Member]):-!.
miembro(Member, [Head|Tail]):-
                        miembro(Member, Tail).
/* E.2 */
extraeUltimo([], []):-!.
extraeUltimo([Last], Last):-!.
extraeUltimo([Head|Tail], Last):-
    extraeUltimo(Tail, Last).




/* 7 - Construye una lista con todos los elementos que se encuentran antes de X elemento. */

antes_de([X, Cabeza|Cola], Cabeza, X).
antes_de([Cabeza|Cola], X, Output) :-
                        antes_de(Cola, X, Return),
                        concatenar([Cabeza], Return, Output).

/* 8 - Determina si una lista númerica está en orden creciente */
creciente([X]).
creciente([Num1, Num2|Cola]):-
                        Num1<Num2,
                        creciente([Num2|Cola]).

/* 9 - Determina si una lista númerica está en orden decreciente. */
decreciente([X]).
decreciente([Num1, Num2|Cola]):-
                        Num1>Num2,
                        decreciente([Num2|Cola]).

/*
15. Definir mediante append los predicados:
a) reverse(Xs,Ys):- Ys es Xs con los elementos en orden inverso.
b) adyacentes(X,Y,Xs):- X e Y están en posiciones consecutivas en Xs.
c) ultimo(Xs,X):- X es el último elemento de Xs.
d) primeros(Xs,Ys):- Ys es el resultado de eliminar el último elemento a Xs. */
revertir([X], [X]).
revertir([Cabeza|Cola], ListaInversa):-
                revertir(Cola, LInv),
                append(LInv, [Cabeza], ListaInversa).
