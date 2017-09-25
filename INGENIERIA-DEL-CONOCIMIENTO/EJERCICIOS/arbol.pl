p(alvaro, h).
p(ana, m).
p(oscar, h).
p(azu, m).
p(alberto, h).
p(ramon, h).
p(alina, m).
p(jesus, h).
p(juana, m).

padres_de(oscar, azu, alvaro).
padres_de(oscar, azu, ana).
padres_de(jesus, juana, alberto).
padres_de(jesus, juana, oscar).
padres_de(jesus, juana, ramon).
padres_de(jesus, juana, alina).

hermanos(X, Y) :- 
    padres_de(P, M, Y), 
    padres_de(P, M, X),
    X \= Y.

hermano(X, Y) :-
    hermanos(X, Y),
    p(X, h).

hermana(XX, Var) :- 
    hermanos(XX, Var),
    p(XX, m).


padre_de(P, X) :- 
    padres_de(P, M, X).

madre_de(M, X) :- 
    padres_de(P, M, X).

abuelos_de(Abuelo, Abuela, N) :-
    padres_de(P, M, N), 
    padres_de(Abuelo, Abuela, P).

abuelos_de(Abuelo, Abuela, N) :-
    padres_de(P, M, N),
    padres_de(Abuelo, Abuelo, M).

tios(T, S) :- 
    padres_de(P, M, S), 
    hermanos(T, P). 
tios(T, S) :- 
    padres_de(P, M, S), 
    hermanos(T, M).
tia_de(T, S) :- 
    tios(T, S), 
    p(T, m).
tio_de(T, S) :- 
    tios(T, S), 
    p(T, m).