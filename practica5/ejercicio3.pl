/*
@author t.me/velastroll
Sabiendo que Marcos es rubio, que Juan es moreno, que Pedro es el padre de Juan, que
Marcos es el padre de Pedro, que Juan es el padre de Ramón. Que una persona es el
padre de otra si ésta es el hijo de la primera. Que una persona es el abuelo de otra -
digamos p - si es el padre de alguien y si este alguien es el padre de p. Y finalmente que
Marcos es hijo de Jorge.
>> ¿Existe un abuelo rubio?
<< esAbuelo(X, Y), esRubio(X).
*/
esRubio(marcos).
esMoreno(juan).
esPadre(pedro, juan).
esPadre(marcos, pedro).
esPadre(juan, ramon).
esHijo(marcos, jorge).
esAbuelo(X, Y):- esPadre(X, Z), esPadre(Z, Y).