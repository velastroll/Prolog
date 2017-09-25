enlinea(1,2,3).
enlinea(4,5,6).
enlinea(7,8,9).
enlinea(1,4,7).
enlinea(2,5,8).
enlinea(3,6,9).
enlinea(1,5,9).
enlinea(3,5,7).

vacio(Casilla, Tablero):-
    argumento(Casilla, Tablero, Valor),
    Valor = "".
cruz(Casilla, Tablero):-
    argumento(Casilla, Tablero, Valor),
    Valor = x.
cara(Casilla, Tablero):-
    argumento(Casilla, Tablero, Valor),
    Valor = o.

amenaza([X, Y, Z], B, R):-
    vacio(X, B), 
    cruz(Y, B), 
    cruz(Z, B), 
    R is X, !.
amenaza([X, Y, Z], B, R):-
    cruz(X, B), 
    vacio(Y, B), 
    cruz(Z, B), 
    R is Y, !.
amenaza([X, Y, Z], B, R):-
    cruz(X, B), 
    cruz(Y, B), 
    vacio(Z, B), 
    R is Z, !.

argumento(Posicion, Lista, X) :-
    Posicion=1,
    argumento(1, Lista, X), !.
argumento(Posicion, Lista, X) :-
    Posicion>1,
    argumento(2, Lista, Y),
    pos is Posicion-1,
    argumento(Pos, Y, X).

movimiento_forzoso(Tablero, Casilla):-
    enlinea(X, Y, Z),
    amenaza([X, Y, Z], Tablero, Casilla).