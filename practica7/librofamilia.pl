/* Consideremos el siguiente programa con información de matrimonios inscritos en el registro */
libro_de_familia(
        esposo(nombre(antonio,garcia,fernandez), profesion(arquitecto), salario(30000)),
        esposa(nombre(ana,ruiz,lopez), profesion(docente), salario(12000)),
        domicilio(sevilla)).
libro_de_familia(
        esposo(nombre(luis,alvarez,garcia), profesion(arquitecto), salario(40000)),
        esposa(nombre(ana,romero,soler), profesion(sus_labores), salario(0)),
        domicilio(sevilla)).
libro_de_familia(
        esposo(nombre(bernardo,bueno,martinez), profesion(docente), salario(12000)),
        esposa(nombre(laura,rodriguez,millan), profesion(medico), salario(25000)),
        domicilio(cuenca)).
libro_de_familia(
        esposo(nombre(miguel,gonzalez,ruiz), profesion(empresario), salario(40000)),
        esposa(nombre(belen,salguero,cuevas), profesion(sus_labores), salario(0)),
        domicilio(dos_hermanas)).


/* (1) Añadir lo conveniente para preguntar quien tiene una determinada profesión. */

trabaja_de(Nombre, Trabajo):-
        libro_de_familia(
            esposo(Nombre, profesion(Trabajo), _),
            _,
            _).
trabaja_de(Nombre, Trabajo):-
        libro_de_familia(
            _,
            esposa(Nombre, profesion(Trabajo), _),
            _).


/* (2) Completar el programa para poder consultar cuáles son los ingresos totales de una familia.*/

ingresos_de(Esposo, Esposa, Ingresos):-
        libro_de_familia(
            esposo(nombre(Esposo,_,_), profesion(_), salario(IngresoEsposo)),
            esposa(nombre(Esposa,_,_), profesion(_), salario(IngresoEsposa)),
            domicilio(_)),
        Ingresos is IngresoEsposa+IngresoEsposo.

/* (3) Hacer lo mismo de manera que sepamos qué personas ganan más de una determinada cantidad. */

gana_mas_de(Persona, Dinero):-
        libro_de_familia(
            esposo(X, profesion(_), salario(Salario)),
            _,
            _),
            Salario>Dinero,
            Persona = X.

gana_mas_de(Persona, Dinero):-
        libro_de_familia(
            _,
            esposa(X, _, salario(Salario)),
            _),
            Salario>Dinero,
            Persona = X.          

/* (4) Y qué personas ganan menos de una determinada cantidad. */

gana_menos_de(Persona, Dinero):-
        libro_de_familia(
            esposo(X, profesion(_), salario(Salario)),
            _,
            _),
            Salario<Dinero,
            Persona = X.

gana_menos_de(Persona, Dinero):-
        libro_de_familia(
            _,
            esposa(X, _, salario(Salario)),
            _),
            Salario<Dinero,
            Persona = X.          
