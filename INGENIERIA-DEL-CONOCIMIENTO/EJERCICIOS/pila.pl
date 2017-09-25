:- dynamic ask/3.
:- dynamic memory/2.
:-op(40, xfy, &).
:-op(50, xfy, --->).

% Vista la funcionalidad de la pila, que se basaen que pasa insertar
% quita el primer elemento y lo añade junto a el elemento que quiera
% añadir, vamos a intentar implementarlo en prolog.
%
% El problema de prolog es que no se puede quitar el ultimo y añadir,
% sino que hay que insertarlo utilizando la cola entera.

mueve(q0, a, [z], q0, [a|z]).
mueve(q0, a, [a|H], q0, [a|[a|H]]).
mueve(q0, b, [a|H], q1, H).
mueve(q1, b, [a|H], q1, H).
mueve(q1,[],[z],qf,[z]).

transita(q1,[],z,qf,[z]):-!.

transita(Qi, [X|Y], R, Qf, T):- 
    X \=[], mueve(Qi, X, R, P, S), transita(P, Y, S, Qf, T).

acepta(X,Resultado) :- 
    transita(q0,X,[z],Q,_), Q=qf, Resultado is 1, !.

% El metainteprete se utiliza para dos cosas: variar computo y busqueda de prolog.

solve(true):- !.
solve((A,B)):- !, solve(A), solve(B).
solve(A):- !, clause(A,B), solve(B).

conectado(w2, w1).
conectado(w3, w2).
valor(w1, 1).
valor(W,X) :-
    conectado(W,V), valor(V,X).

%%%%

builtin(A is B).
builtin(A = B).
builtin(A >= B).
builtin(read(X)).
builtin(A > B).
builtin(A < B).
builtin(A =:= B).
builtin(A =< B).
builtin(functor(T, F, N)).
builtin(write(X)).
solve(true,true) :- !.
solve((A, B), (ProofA, ProofB)) :-!, solve(A, ProofA),
solve(B, ProofB).
solve(A, (A:-builtin)):- builtin(A), !, A.
solve(A, (A:-Proof)) :- clause(A, B), solve(B, Proof).

% Propagación de señal.

true ---> valor(w1, 1).
true ---> conectado(w2, w1).
true ---> conectado(w3, w2).
conectado(W,V) & valor(V,X) ---> valor(W,X).

% Completamos lo que falta:
% - Pista: aparece true, --->

solve(true):-!.
solve((A & B)) :-!, solve(A), solve(B).
solve(A) :- !, true ---> solve(B).