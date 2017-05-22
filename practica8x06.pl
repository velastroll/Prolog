% a) Descomponer una lista en dos:
descomponer([Xs|Ys],Xs,Ys).
descomponer([],[],[]).
descomponer([As|Bs],[As|Xs],B):-descomponer(Bs,Xs,B).
% b) Borrar algunos elementos de la lista:
borrarAlgunos([X,X,X|_],[X,X,X],[]).
borrarAlgunos([Xs|Ys],[X|Y],Borrada):-borrarAlgunos(Ys,[X|Y],[Xs|Borrada]).
%invertir una lista:
invertir([],[]).
invertir([Cabeza|Cuerpo],L):-invertir(Cuerpo,Resto),append(Resto,[Cabeza],L).
% c) invertir los tres últimos elementos de una lista
tresUltimos([X,Y,Z],[]).
tresUltimos([X,Y],[]).
tresUltimos([X],[]).
tresUltimos([],[]).
tresUltimos([Xs|Ys],[Xs|Bs]):-tresUltimos(Ys,Bs).
% d) miembro a partir de concatenar (append?) el ejercicio sigue la
% misma lógica sin append
miembro(X,Y):-append(X,Y,[Rs|Rb]),esmiembro(Rs,Rb).
esmiembro(Rs,[Rs|_]).
esmiembro(Rs,[_|Rb]):-esmiembro(Rs,Rb).
% e) eliminar el último SIN CONCATENAR:
eliminaUlt([],[]).
eliminaUlt(L,Eliminada):-invertir(L,[Xs|Ys]),invertir(Ys,Eliminada).
% e) elimina el último CON CONCATENAR: (feo pero funciona)
eliminaConc([],[]).
eliminaConc([X],[]).
eliminaConc([X,Y],[X|Ys]).
eliminaConc([Xs|Ys],[Rz]):-eliminaConc(Ys,R),append([Xs],[R],Rz).
