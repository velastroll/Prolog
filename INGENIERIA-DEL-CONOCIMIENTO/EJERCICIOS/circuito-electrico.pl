% PRIMERO: dar de alta todos los elementos del circuito.
%       SIEMPRE ponermos PRIMERO los hechos y DESPUES las reglas.
% SEGUNDO: Modelar el funcionamiento
% nos centramos en el funcionamiento, ¿l1 luce?
% lit(l1):-ok(l1), light(l1), live(l1) = si está bien, es una bombilla y tiene corriente.
% y le llega corriente? live(l1)
% live(X) :-- connected(X, W), live(W)
% OBJETIVO: Si luce una bombilla. lit(L)



%   E J E M P L O

connected(w3, w5) :-
    ok(cb1), on(cb1).
connected(w6, w5) :-
    ok(cb2), on(cb2).
connected(w1, w3) :- ok(s1), up(s1).
connected(w2, w3) :- ok(s1), down(s1).
connected(w0, w1) :- ok(s2), up(s2).
connected(w0, w2) :- ok(s2), down(s2).
connected(w4, w3) :- ok(s3), up(s3).
connected(w5, powerOutside).
connected(l1, w0).
connected(l2, w4).
connected(p1, w3).
connected(p2, w6).

ok(_).
on(cb1).
on(cb2).
up(s2).
up(s3).
down(s1).
light(l1).
light(l2).
live(powerOutside).

%  R E G L A S 

lit(L) :-
    ok(L), light(L), live(L).
live(X) :-
    connected(X, W), live(W).

% connected(X, Y) :- connected(Y, X).
connected(X, Z) :-
    connected(X, Y), connected(Y, Z).


% FUNCIONA CON ?-lit(l2) PERO CON ?-lit(l1) DA ERROR POR STACK (debería dar false)
% PREGUNTAR ESA DUDA.





