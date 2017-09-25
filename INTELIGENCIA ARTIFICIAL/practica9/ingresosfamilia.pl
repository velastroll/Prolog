/*
@author t.me/Velastroll
El predicado familia tiene como argumentos los miembros de una familia.
El primero es el padre, el segundo la madre y el tercero es la lista de hijos.
Cada componente de la familia se expresa mediante la función persona(Nombre,Apellido1,Sueldo)
*/
familia(
    persona(juan,perez,5000),
    persona(maria,alonso,10000),
    [   persona(carlos,perez,0),
        persona(andres,perez,0),
        persona(elena,perez,200)    ]).

familia(
    persona(pedro,lopez,25000),
    persona(carmen,ruiz,15000),
    [   persona(carlos,lopez,1000),
        persona(teresa,lopez,0)     ]).

sueldo(persona(_,_,S),S).

/* Añadir a este programa las líneas necesarias para poder
    calcular el total de los ingresos de una familia. 
    
    > Dado el nombre del padre o de la madre con 'persona(,,)'
      la funcion 'total' ya da el ingreso de toda la familia.
*/

total([], Ingreso):- !.
total([Padre, Madre, Cola], Ingresos):-
                familia(Padre, Madre, Cola),
                sueldo(Padre, Sp),
                sueldo(Madre, Sm),
                sueldoHijos(Cola, Sh),
                Ingresos is Sp + Sm + Sh.

sueldoHijos([], Sueldo):-!.
sueldoHijos([Ultimo], Sueldo):-
                sueldo(Ultimo, Sueldo).

sueldoHijos([Cabeza|Cola], Sueldo):-
                sueldo(Cabeza, S1),
                sueldoHijos(Cola, S2),
                Sueldo is S1+S2.



                