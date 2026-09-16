"
PJConsoleTest teste la lecture d'une saisie (saisie correcte, voiture 
inconnue, direction inconnue et saisie mal formee). La boucle de jeu playOn: attend un joueur 
et se verifie a la main.
"
Class {
	#name : 'PJConsoleTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'tests' }
PJConsoleTest >> testMoveFromMalformedInput [
   	| parking console |
   	parking := PJParking fromString: (String cr join: #('AA..' '....')).
   	console := PJConsole new.
   	self assert: (console moveFrom: '' on: parking ifInvalid: [ #invalid ]) equals: #invalid.
   	self assert: (console moveFrom: 'A' on: parking ifInvalid: [ #invalid ]) equals: #invalid.
   	self assert: (console moveFrom: 'AB right' on: parking ifInvalid: [ #invalid ]) equals: #invalid.
   	self assert: (console moveFrom: 'A right now' on: parking ifInvalid: [ #invalid ]) equals: #invalid
]

{ #category : 'tests' }
PJConsoleTest >> testMoveFromUnknownCar [
   	| parking result |
   	parking := PJParking fromString: (String cr join: #('AA..' '....')).
   	result := PJConsole new moveFrom: 'Z right' on: parking ifInvalid: [ #invalid ].
   	self assert: result equals: #invalid
]

{ #category : 'tests' }
PJConsoleTest >> testMoveFromUnknownDirection [
   	| parking result |
   	parking := PJParking fromString: (String cr join: #('AA..' '....')).
   	result := PJConsole new moveFrom: 'A forward' on: parking ifInvalid: [ #invalid ].
   	self assert: result equals: #invalid
]

{ #category : 'tests' }
PJConsoleTest >> testMoveFromValidInput [
   	| parking move |
   	parking := PJParking fromString: (String cr join: #('AA..' '....')).
   	move := PJConsole new moveFrom: 'A right' on: parking ifInvalid: [ #invalid ].
   	self assert: move printString equals: 'a PJMove A right'
]
