# ParkingJam

Jeu du stationnement (Parking Jam) en Pharo 13.

## Installation

```smalltalk
Metacello new
    baseline: 'ParkingJam';
    repository: 'github://Felix-TANZI/ParkingJam:master/src';
    load.
```

## Regles

- Une voiture avance d'une case par coup, seulement dans son axe.
- Le coup est bloque si la case visee est occupee (voiture ou plot).
- Une voiture dont l'avant est au bord sort du parking en un coup.
- La partie est gagnee quand il ne reste plus de voiture.

Dans le vrai jeu, une voiture glisse jusqu'a l'obstacle. Avancer d'une case par coup est un choix volontaire, qui garde le solveur simple.

Legende : `.` case vide, `#` plot, une lettre repetee pour une voiture.

## Utilisation

Jouer au clavier (saisir par exemple `A right`, ou `quit`) :

```smalltalk
PJConsole new playOn: (PJParking fromString: (String cr join: #('AA.B' '...B' '....'))).
```

Trouver une solution par force brute :

```smalltalk
(PJSolver on: (PJParking fromString: (String cr join: #('#AAB' '...B'))))
    solutionIfNone: [ 'aucune solution' ].
```

## Tests

Les tests sont dans le paquet `ParkingJam` (classes `PJ...Test`).
