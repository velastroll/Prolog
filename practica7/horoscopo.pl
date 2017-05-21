/*
Escribir un programa Prolog que permita saber el horóscopo de una persona a partir de su fecha de
nacimiento.

a) Mejora este programa de forma que el día esté comprendido dentro del rango permitido para
cada mes. Por ejemplo, no podemos poner el 30 de febrero. No es necesario comprobar si el
año es bisiesto. No compliques la regla "signo" con condiciones complejas, sino que añade los
hechos que consideres oportunos (“el mes de marzo tiene 31 días”). */

/*signo(Nombre, DiaInicio, MesInicio, DiaFin, MesFin).*/
signo(aires, 20, 3, 19, 4).
signo(tauro, 10, 4, 20, 5).
signo(geminis, 21, 5, 20, 6).
signo(cancer, 21, 6, 22, 7).
signo(leo, 23, 7, 22, 8).
signo(virgo, 23, 8, 22, 9).
signo(libra, 23, 9, 22, 10).
signo(escorpio, 23, 10, 21, 11).
signo(sagitario, 22, 11, 21, 12)
signo(capricornio, 22, 12, 19, 1).
signo(acuario, 20, 1, 17, 2).
signo(piscis, 18, 2, 19, 3).

/* maximos: max(Mes, Dia) */
max(1, 32).
max(2, 29).
max(3, 32).
max(4, 31).
max(5, 32).
max(6, 31).
max(7, 32).
max(8, 32).
max(9, 31).
max(10, 32).
max(11, 31).
max(12, 32).

cumple(Dia, Mes, Horoscopo):-
    max(Mes, MaxDia), Dia < MaxDia,
    signo(Horoscopo, DiaInicio, MesInicio, DiaFin, MesFin),
    MesInicio = Mes, Dia>DiaInicio-1.

cumple(Dia, Mes, Horoscopo):-
    max(Mes, MaxDia), Dia < MaxDia,
    signo(Horoscopo, DiaInicio, MesInicio, DiaFin, MesFin),
    MesFin = Mes,  Dia<DiaFin+1.
