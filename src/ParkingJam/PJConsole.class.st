"
PJConsole permet de jouer au clavier. Elle affiche la grille dans une fenetre 
de saisie, lit le coup tape (une lettre de voiture puis une direction, par exemple A right), le fait jouer par le parking et recommence jusqu'a la victoire ou 
jusqu'a la saisie de quit. Elle ne contient aucune regle du jeu. La lecture d'une saisie se fait avec moveFrom:on:ifInvalid:, qui execute le bloc donne si la saisie est 
mal formee ou designe une voiture ou une direction inconnue. Une partie se lance avec playOn: (par exemple PJConsole new playOn: (PJParking fromString: 'AA.')).
"
Class {
	#name : 'PJConsole',
	#superclass : 'Object',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'reading' }
PJConsole >> moveFrom: aString on: aParking ifInvalid: aBlock [
   	| words carName direction |
   	words := aString substrings.
   	(words size = 2 and: [ words first size = 1 ]) ifFalse: [ ^ aBlock value ].
   	carName := words first first.
   	(aParking hasCarNamed: carName) ifFalse: [ ^ aBlock value ].
   	direction := words second asSymbol.
   	(#(#up #down #left #right) includes: direction) ifFalse: [ ^ aBlock value ].
   	^ PJMove car: carName direction: direction
]

{ #category : 'playing' }
PJConsole >> play: aString on: aParking [
   	| move |
   	move := self moveFrom: aString on: aParking ifInvalid: [ ^ 'Invalid input: ' , aString ].
   	^ move printString , ' -> ' , (aParking play: move)
]

{ #category : 'playing' }
PJConsole >> playOn: aParking [
   	| status answer |
   	status := 'New game'.
   	[ aParking isSolved ] whileFalse: [
   		answer := (UIManager default request: (self promptFor: aParking status: status)) ifNil: [ 'quit' ].
   		answer trimBoth = 'quit' ifTrue: [ ^ #quit ].
   		status := self play: answer on: aParking ].
   	UIManager default inform: 'The parking is empty, you won'.
   	^ #won
]

{ #category : 'printing' }
PJConsole >> promptFor: aParking status: aString [
   	^ String streamContents: [ :stream |
   		stream
   			nextPutAll: aParking asciiString;
   			cr;
   			nextPutAll: aString;
   			cr;
   			nextPutAll: 'Type a car and a direction (up, down, left, right), or quit' ]
]
