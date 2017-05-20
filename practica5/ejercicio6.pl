/*
@author t.me/velastroll
A todas las madres les gusta su hijo si su hijo es bueno.
Toda madre es una mujer.
Ana es una mujer.
El marido de Ana es bueno.

>> ¿Existe alguna mujer a la que le guste algún marido?
<<      ¡¡ SIN RESOLVER !!
*/

leGusta(X, Y) :- esMadre(X, Y), esBueno(Y).
esMujer(X) :- esMadre(X, Y).
esMujer(ana).
esBueno(marido(ana)).