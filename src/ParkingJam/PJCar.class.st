"
PJCar est la classe abstraite des voitures du parking. Une voiture connait son nom (un caractere), la position de sa premiere case et sa longueur. Ses classes filles decident des directions permises et des cases occupees. La voiture avance quand on le lui demande et c'est le parking qui decide si le coup est permis. Ses messages principaux sont (name, cells, canMoveTowards:, frontCellTowards:, moveTowards:). Une voiture se cree avec named:at:length:.
"
Class {
	#name : 'PJCar',
	#superclass : 'Object',
	#instVars : [
		'name',
		'position',
		'length'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJCar class >> named: aCharacter at: aPoint length: anInteger [
   	^ self new
   		setName: aCharacter position: aPoint length: anInteger;
   		yourself
]

{ #category : 'instance creation' }
PJCar class >> named: aCharacter cells: someCells [
   	| carClass |
   	carClass := (someCells allSatisfy: [ :each | each y = someCells first y ])
   		ifTrue: [ PJHorizontalCar ]
   		ifFalse: [ PJVerticalCar ].
   	^ carClass named: aCharacter at: someCells first length: someCells size
]

{ #category : 'printing' }
PJCar >> character [
   	^ name
]

{ #category : 'accessing' }
PJCar >> frontCellTowards: aDirection [
   	| offset |
   	offset := self offsetTowards: aDirection.
   	^ (self cells collect: [ :each | each + offset ])
   		detect: [ :each | (self cells includes: each) not ]
]

{ #category : 'moving' }
PJCar >> moveTowards: aDirection [
   	position := position + (self offsetTowards: aDirection)
]

{ #category : 'accessing' }
PJCar >> name [
   	^ name
]

{ #category : 'private' }
PJCar >> offsetTowards: aDirection [
   	^ {
   		  (#up -> (0 @ -1)).
   		  (#down -> (0 @ 1)).
   		  (#left -> (-1 @ 0)).
   		  (#right -> (1 @ 0)) } asDictionary at: aDirection
]

{ #category : 'printing' }
PJCar >> printOn: aStream [
   	super printOn: aStream.
   	aStream
   		nextPutAll: ' ';
   		nextPut: name;
   		nextPutAll: ' at ';
   		print: position;
   		nextPutAll: ' length ';
   		print: length
]

{ #category : 'initialization' }
PJCar >> setName: aCharacter position: aPoint length: anInteger [
   	name := aCharacter.
   	position := aPoint.
   	length := anInteger
]
