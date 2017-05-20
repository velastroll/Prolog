conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

insertar(X, Lista, Resultado) :- Resultado = [X|Lista].
insertar2(X, Lista, [X|Lista]).

cambiar(X, Y, Z):-cambiar(Y, X, Z).
cambiar([no, soy], eres):- cambiar(eres, [no, soy]).

borrar(X, [X|Cola1], Cola1).
borrar(X, [X2|Cola2], [X2|Cola3]):-
          borrar(X, Cola2, Cola3).

s
lista([]):-!.
lista([X|Y]):-lista(Y).

/* Devuelve el elemento que se encuentra en la enesima posicion*/
posicion_n([],N,[]):-!.
posicion_n([X|N],1,X):-!.
posicion_n([X|R],N,S):-M is N - 1,posicion_n(R,M,S).
/*------------------------------------------------------------------*/
/*  Saca los primeros N elementos de una lista y devuelve el resto. */
quita_los_n([], N, []):-!.
quita_los_n([X|C], 1, C):-!.
quita_los_n([X|C], N, S) :- M is N-1, quita_los_n(C, M, S).


/*  # PRÁCTICA 9 #

    1. Suma los elementos de una lista */

suma_lista([X], X):-!.
suma_lista([X|C], R):- suma_lista(C, T), R is T + X.

/* 2. Construye una lista con todos los elementos que se encuentran antes de un cierto elemento en una lista dada. 
    Utilizando append y dandole el resultado  y una lista, podemos obtener la otra.
*/
anteriores([], , Final) :- Final = [].
anteriores([N], N, Final) :- !.
anteriores([N|Cola], N, F) :- !.
anteriores([X|Cola], N, F) :-  anteriores(Cola, N, Ant), append(Ant, [X], F), !.

/* 3. Elimina el elemento que se encuentra en la enésima posición. */
resto_n([], N, []):-!.
resto_n([X|C], 1, D):-!.
resto_n([X|C], N, S) :- M is N-1, resto_n(C, M, S).
eliminar_n([],N,[]):-!.
eliminar_n(Lista, N, S) :-
                        resto_n(Lista, N, F),
                        append(I, F, S).
                        