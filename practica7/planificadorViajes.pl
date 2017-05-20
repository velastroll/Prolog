/* Precio del transporte.*/

transporte(roma, 200).
transporte(londres, 500).
transporte(tunez, 150).

/* ALOJAMIENTO */

alojamiento(hotel, roma, 250).
alojamiento(hotel, londres, 150).
alojamiento(hotel, tunez, 100).
alojamiento(hostal, roma, 150).
alojamiento(hostal, londres, 100).
alojamiento(hostal, tunez, 80).
alojamiento(camping, roma, 100).
alojamiento(camping, londres, 500).
alojamiento(camping, tunez, 50).

/* OPERACIONES */

suma(A, B, resultado) :- 
    resultado is A + B.

planifica(D, L, C, Res) :- 
    alojamiento(L, C, X),
    suma(D, X, Res).
    