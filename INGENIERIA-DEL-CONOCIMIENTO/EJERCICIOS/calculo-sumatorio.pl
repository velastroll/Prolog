f(0, 0).
f(1, 1).
f(N, Total) :-
    Ant is N-1,
    Antant is N-2,
    f(Ant, ResAnt),
    f(Antant, ResAntant),
    Total is 3*ResAnt + 2*ResAntant.

sumatorio(N, Total):-
    N>0,
    f(N, ResParcial),
    N--,
    sumatorio(N, ResResto),
    Total is ResResto + ResParcial.
