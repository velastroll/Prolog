%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - numlist nos da un vector del numero de columnas    %
% - permutation nos va dando variaciones de ese vector %
% - diagsok comprueba que la primera reina esté en     %
%    diferente fila que el resto, para despues         %
%    comprobar las siguientes reinas recursivamente.   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

reinas(N, Res):-
    numlist(1, N, Base),
    permutation(Res, Base),
    diagsOK(Res).

diagsOK([]):- !.
diagsOK([P|F]):-
    diagReinas(P, F, 1),
    diagsOK(F).

diagReinas(_,[],_):- true.
diagReinas(Reina, [Head|Tail], Col):-
    (Reina + Col) =\= Head,
    (Reina - Col) =\= Head,
    diagReinas(Reina, Tail, Col+1).


    
    
    



