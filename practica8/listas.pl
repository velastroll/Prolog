/********************************/
/*     EJERCICIOS DE LISTAS     */
/*                              */
/*   @author t.me/Velastroll    */
/********************************/

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


/* 6 - Eliminar todos los elementos que siguen a 'z,z,z' y estos incluidos. */
/*                       NO ME SALE HOSTIA                      */
eliminar_zzz([Cabeza|Cola], Salid
eliminar_zzz([Cabeza|Cola], [Cabeza|Salida]) :-
                            eliminar_zzz(Cola).

/* 7 - Construye una lista con todos los elementos que se encuentran antes de X elemento. */

antes_de([X, Cabeza|Cola], Cabeza, X).
antes_de([Cabeza|Cola], X, [Cabeza|Salida]) :-
                        antes_de(Cola, X, Salida).

/* 8 - Determina si una lista númerica está en orden creciente */
creciente([X]).
creciente([Num1, Num2|Cola]):-
                        Num1<Num2,
                        creciente([Num2|Cola]).

/* 9 - DEtermina si una lista númerica está en orden decreciente. */
decreciente([X]).
decreciente([Num1, Num2|Cola]):-
                        Num1>Num2,
                        decreciente([Num2|Cola]).