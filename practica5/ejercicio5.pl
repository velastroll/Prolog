/*
@author t.me/velastroll
Cualquiera que apruebe su examen de Inteligencia Artificial y le toque la lotería es
feliz. Cualquiera que estudie o sea afortunado aprueba todos sus exámenes. Pedro
estudia. Juan no estudió pero es afortunado. Cualquiera que sea afortunado le toca la
lotería.
>> ¿Es feliz Juan?
<< esFeliz(juan).
*/

esFeliz(X) :- leToca(X), aprueba(X).
aprueba(X) :- estudia(X).
aprueba(X) :- esAfortunado(X).
estudia(pedro).
esAfortunado(juan).
leToca(X) :- esAfortunado(X).