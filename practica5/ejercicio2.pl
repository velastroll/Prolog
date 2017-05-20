/*
@author t.me/velastroll
Todos los que ayudan a Juan viven en casa de Manolo.
Antonio ayuda a todos aquellos con los que trabaja.
Trabajan con Juan todos los amigos de Carlos.
Antonio es amigo de Carlos.
>> ¿Quién vive en casa de Manolo?
<< vive(X).
*/
vive(X) :-  ayuda(X, juan).
ayuda(antonio, X) :- trabaja(antonio, X).
ayuda(antonio, X) :- trabaja(X, antonio).
trabaja(X, juan) :- amigo(X, carlos).
amigo(antonio, carlos).

