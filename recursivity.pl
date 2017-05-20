antecessor_of(alvarosFather, alvaro).
antecessor_of(alvaro, alvarosSon).
antecessor(Ant, Son):-antecessor_of(Ant, Son).
antecessor(Ant, Son):-antecessor_of(Ant, AntSon), antecessor_of(AntSon, Son).
