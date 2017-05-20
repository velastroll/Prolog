familia(persona(juan,perez,5000),
    persona(maria,alonso,10000), 
    [persona(carlos,perez,0), persona(andres,perez,0), persona(elena,perez,200)]).
 
familia(persona(pedro,lopez,25000),
    persona(carmen,ruiz,15000),
    [persona(carlos,lopez,1000), persona(teresa,lopez,0)]). 
 
familia(persona(luis,alvarez,2),
    persona(ana,romero,1),
    []).
 
sueldo(persona(_,_,S),S). 
 
/*--------Mayor sueldo de la familia?-----------------------------------
 
mayorsueldo(ApellidoPadre,Sueldo) = Sueldo es el mayor sueldo de los miembros de la familia "ApellidoPadre".
lista(L,Sueldo) = Sueldo es el mayor sueldo de los elementos de la lista L.
 
---------------------------------------------------------------------------*/
 
mayorsueldo(Ap,S):-
                    familia(persona(Np,Ap,Sp),Madre,L),
                    lista([persona(Np,Ap,Sp),Madre|L],S).
lista([],0).

lista([X|L],S):-
        sueldo(X,S1),
        lista(L,Smax),
        S1<Smax,
        S is Smax.

lista([X|L],S):-
        sueldo(X,S1), 
        S is S1.
 
 
 
/*--------Numero de hijos-----------------------------------
 
a) Consulta que familias tienen mas de X hijos
b) Consulta que familias tienen menos de X hijos
c) Consulta que familias tienen entre Ci y Cs hijos
*/
 
/*A*/
mashijos(X,Ap):-familia(persona(_,Ap,_),_,L), numhijos(L,Num), Num > X.
/*B*/
menoshijos(X,Ap):-familia(persona(_,Ap,_),_,L), numhijos(L,Num), Num < X.
/*C*/
interhijos(Ci,Cs,Ap):-menoshijos(Cs,Ap),mashijos(Ci,Ap).
 
numhijos([],0).
numhijos([X|L],N):-numhijos(L,N1), N = N1+1.