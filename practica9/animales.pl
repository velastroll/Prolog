atributo(animal,puede,respirar).
atributo(ave,vuela,bien).
atributo(ave,tiene,plumas).
atributo(ave,pone,huevos).
atributo(gorrion,patas,cortas).
atributo(gorriolin1,color,marron).
atributo(gorriolin2,,).
atributo(canario,canta,bien).
atributo(piolin,color,amarillo).
atributo(mamifero,da,leche).
atributo(oveja,da,lana).
atributo(catalina,,).
atributo(vaca,come,hierba).
atributo(rosenda,color,amarillo).
 
 
es_un(ave,animal).
es_un(gorrion,ave).
es_un(gorriolin1,gorrion).
es_un(gorriolin2,gorrion).
es_un(canario,ave).
es_un(piolin,canario).
es_un(mamifero,animal).
es_un(oveja,mamifero).
es_un(catalina,oveja).
es_un(vaca,mamifero).
es_un(rosenda,vaca).
 
conc(X, L2, [X|L2]).
 
/*lista(oveja,([(da,lana),(da,leche),(puede,respirar)]).*/
 
 
atrib(Individuo, B) :- listaAtrib(Individuo,Individuo, B, []).

listaAtrib(Individuo,Padre, B, C) :-    % Si el atributo no está, se incluye.
    givemeatrib(Padre,X1,X2),
    not(esta(atributo(Individuo,X1,X2),C)), 
    conc(atributo(Individuo,X1,X2),C,C1),  
    listaAtrib(Individuo,Padre,B,C1),
    !.

listaAtrib(A,P, B, C) :-                %Si el atributo está, se busca el de su padre.
    es_un(P,Padre),
    givemeatrib(Padre,X1,X2), 
    conc(atributo(A,X1,X2),C,C1), 
    listaAtrib(A,Padre,B,C1),!.

listaAtrib(_,_,L,L):-!.
 
givemeatrib(A,X1,X2):- atributo(A,X1,X2).
 
esta(Y,[Y|_]).
esta(Y,[_|L]):- esta(Y,L).


es(X,Y) :- es_un(X,Y).
es(X,Y) :- es_un(X,Y1),es(Y1,Y).

/* 
    - Dados dos atributos, muestra quien lo hace, y posteriormente dice quienes son sus hijos.
    - Dado un Animal, no sabemos como coño lo hace, pero te dice lo que hacen sus padres.
*/
consulta(Animal,Atributo,Valor) :- 
    atributo(Animal,Atributo,Valor).

consulta(Animal,Atributo,Valor) :- 
    atributo(QuienLoHace,Atributo,Valor),
    es(Animal,QuienLoHace).


