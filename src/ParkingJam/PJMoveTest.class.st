"
PJMoveTest teste la creation et l'affichage d'un coup.
"
Class {
	#name : 'PJMoveTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'tests' }
PJMoveTest >> testPlayMovesCar [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('AA..' '....')).
   	self assert: (parking play: (PJMove car: $A direction: #right)) equals: #moved.
   	self assert: parking asciiString lines equals: #('.AA.' '....')
]

{ #category : 'tests' }
PJMoveTest >> testPrintString [
   	| move |
   	move := PJMove car: $A direction: #right.
   	self assert: move printString equals: 'a PJMove A right'
]
