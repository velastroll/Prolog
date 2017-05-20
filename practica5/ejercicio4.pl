/*
@author t.me/velastroll
A Juan le gusta toda clase de comida. Las manzanas son comida. El pollo es comida.
Cualquier cosa que uno coma y no le mate es comida. Guillermo come cacahuetes y
aún está vivo. Susana come todo lo que come Guillermo.
>> ¿A Juan le gustan los cacahuetes?
<< leGusta(juan, cacahuetes).
*/

leGusta(juan, X):-esComida(X).
esComida(manzanas).
esComida(pollo).
esComida(X):- come(Y, X), noMata(X, Y).
come(guillermo, cacahuetes).
noMata(cacahuetes, guillermo).
come(susana, X) :- come(guillermo, X).