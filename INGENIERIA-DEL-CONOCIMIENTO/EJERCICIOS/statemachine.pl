%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INGENIERÍA DEL CONOCIMIENTO %
% 18 OCTUBRE 2017             %
% ALVARO VELASCO              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mueve(q0, a, q2).
mueve(q0, b, q1).
mueve(q1, a, q0).
mueve(q1, b, q3).
mueve(q2, a, q2).
mueve(q2, b, q3).
mueve(q3, a, q0).
mueve(q3, b, q3).

transita(Qi, [], Qi).
transita(Qi, [Head|Tail], Qj):-
    mueve(Qi, Head, Qx), transita(Qx, Tail, Qj).

%
% Para que pertenezca al lenguaje siempre tiene que acabar en un estado final,
% del que no puede salir, dada una cadena de transicion.
%
% Pongamos que el inicial es q0 y queremos que el final es q1.
%
% acepta([a,b,b,a,b], Res) -> Res=1 si [a,b,b,a,b] pertenece al lenguaje.
%

acepta(X, Res) :-
    transita(q0, X, Q), Q=q1, Res is 1, !.

