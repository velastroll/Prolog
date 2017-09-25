:- dynamic ask/3.
:- dynamic memory/2.

ladosIguales(X):- ask(ladosIguales, '¿Cuantos lados iguales tiene la figura? ', X).
anguloRecto(X):- ask(anguloRecto, '¿La figura posee angulos rectos (si, no)? ', X).
ladosParalelos(X):- ask(ladosParalelos, '¿Cuantos lados paralelos tiene la figura (0, 2 o 4)? ', X).
orden(X):- ask(orden, '¿Cuantos lados? ', X).

nombre(triangulo) :- orden(3).
nombre(trianguloIsosceles) :-  nombre(triangulo),ladosIguales(2).
nombre(trianguloRectangulo) :- nombre(triangulo),anguloRecto(si).
nombre(trianguloRectanguloIsosceles) :- nombre(trianguloIsosceles), nombre(trianguloRectangulo).
nombre(trianguloEquilatero) :- nombre(triangulo), ladosIguales(3).
nombre(cuadrilatero) :- orden(4).
nombre(trapecio) :- nombre(cuadrilatero), ladosParalelos(2).
nombre(paralelogramo) :- nombre(cuadrilatero), ladosParalelos(4).
nombre(rectangulo) :- nombre(paralelogramo), anguloRecto(si).
nombre(rombo) :- nombre(paralelogramo), ladosIguales(4).
nombre(cuadrado):- nombre(rombo), nombre(rectangulo).

solve:- retractall(memory(_,_)), findall(X, nombre(X), R), write(R).