"
PJSolver trouve par force brute la suite de coups la plus courte qui vide un parking. 
Il fait un parcours en largeur. A partir du parking de depart, il essaie tous les coups possibles 
(chaque voiture dans chaque direction) sur des copies du parking, garde les etats nouveaux dans une file et recommence. Il reconnait un etat deja vu grace a son dessin (asciiString), 
ce qui evite de tourner en rond. La solution s'obtient avec solutionIfNone:, 
qui renvoie la liste des coups (vide si le parking est deja vide) ou execute le bloc donne s'il 
n'existe aucune solution. Un solveur se cree avec on: (par exemple (PJSolver on: aParking) solutionIfNone: [ nil ]).
"
Class {
	#name : 'PJSolver',
	#superclass : 'Object',
	#instVars : [
		'parking'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJSolver class >> on: aParking [
   	^ self new
   		setParking: aParking;
   		yourself
]

{ #category : 'initialization' }
PJSolver >> setParking: aParking [
   	parking := aParking
]

{ #category : 'solving' }
PJSolver >> solutionIfNone: aBlock [
   	| queue seen |
   	queue := OrderedCollection with: parking -> OrderedCollection new.
   	seen := Set with: parking asciiString.
   	[ queue isEmpty ] whileFalse: [
   		| current state moves |
   		current := queue removeFirst.
   		state := current key.
   		moves := current value.
   		state isSolved ifTrue: [ ^ moves ].
   		state possibleMoves do: [ :move |
   			| next |
   			next := state copy.
   			((next play: move) ~= #blocked and: [ (seen includes: next asciiString) not ])
   				ifTrue: [
   					seen add: next asciiString.
   					queue add: next -> (moves copyWith: move) ] ] ].
   	^ aBlock value
]
