
pieza_basica(llanta).
pieza_basica(radios).
pieza_basica(eje).
pieza_basica(manillar).
pieza_basica(sillin).
pieza_basica(cadena).
pieza_basica(plato).
pieza_basica(pedales).
pieza_basica(pinones).

ensamblaje(traccion, 
    [eje, plato, pedales, cadena]).
ensamblaje(rueda_delantera, 
    [llanta,radios, eje]).
ensamblaje(rueda_trasera, 
    [llanta,radios,eje,pinones]).
ensamblaje(cuadro,
    [manillar, sillin, traccion]).
ensamblaje(bicicleta, 
    [rueda_delantera, cuadro, rueda_trasera]).

piezas_de([], []).
piezas_de(basica, [basica]) :-
    pieza_basica(basica).
piezas_de(Parte, Lista) :-
    ensamblaje(Parte, Piezasdeparte),
    listadepiezas(Piezasdeparte, Lista).

listadepiezas([], []).
listadepiezas([Cabeza|Cola], Total):-
    piezas_de(Cabeza, PiezasCabeza)
    listadepiezas(Cola, RestoPiezas),
    append(PiezasCabeza, RestoPiezas, Total).

