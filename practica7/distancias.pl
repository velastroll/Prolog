enlace(ciudad1, ciudad2, distancia).

enlace(a,b,3).
enlace(a,c,2).
enlace(c,d,4).
enlace(c,e,5). 

ruta(A, B, C) :- enlace(A, B, C).
ruta(A, B, C) :- 
    enlace(A, A1, D1),
    ruta(A1, B, D2),
    sumar(D1, D2, C).

sumar(X, Y, Res):-
        Res is X + Y. 