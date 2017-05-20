/*
@author t.me/velastroll
Todos los que enseñan asignaturas de Informática son inteligentes
Juan enseña la asignatura ALG
La mujer de Juan enseña la asignatura IA
ALG es una asignatura de Matemáticas
IA es una asignatura de Informática
>> ¿alguien es inteligente?
<< inteligente(X).
*/

inteligente(X):-enseña(X, Y),
                esAsignatura(Y, inf).
enseña(juan, alg).
enseña(mujer(juan), ia).
esAsignatura(alg, matematicas).
esAsignatura(ia, inf).
