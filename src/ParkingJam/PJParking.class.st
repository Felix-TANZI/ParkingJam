"
PJParking est la grille du jeu. 
Il connait sa largeur, sa hauteur, ses voitures et ses plots. 
Il sait se dessiner en texte avec asciiString, une ligne par rangee (point pour une case vide, diese pour un plot, lettre pour une voiture). 
Ses messages principaux sont (width, height, addCar:, addBollard:, asciiString). 
Un parking se cree vide avec width:height: ou a partir d'un dessin avec fromString:.
"
Class {
	#name : 'PJParking',
	#superclass : 'Object',
	#instVars : [
		'width',
		'height',
		'cars',
		'bollards'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJParking class >> fromString: aString [
   	| lines |
   	lines := aString lines.
   	^ (self width: lines first size height: lines size)
   		readLines: lines;
   		yourself
]

{ #category : 'instance creation' }
PJParking class >> width: aWidth height: aHeight [
   	^ self new
   		setWidth: aWidth height: aHeight;
   		yourself
]

{ #category : 'adding' }
PJParking >> addBollard: aBollard [
   	bollards add: aBollard
]

{ #category : 'adding' }
PJParking >> addCar: aCar [
   	cars add: aCar
]

{ #category : 'printing' }
PJParking >> asciiString [
   	^ String streamContents: [ :stream |
   		1 to: height do: [ :y |
   			1 to: width do: [ :x | stream nextPut: (self characterAt: x @ y) ].
   			stream cr ] ]
]

{ #category : 'printing' }
PJParking >> characterAt: aPoint [
   	^ self elements
   		detect: [ :each | each cells includes: aPoint ]
   		ifFound: [ :element | element character ]
   		ifNone: [ $. ]
]

{ #category : 'accessing' }
PJParking >> elements [
   	^ cars , bollards
]

{ #category : 'accessing' }
PJParking >> height [
	^ height
]

{ #category : 'initialization' }
PJParking >> initialize [
   	super initialize.
   	cars := OrderedCollection new.
   	bollards := OrderedCollection new
]

{ #category : 'printing' }
PJParking >> printOn: aStream [
   	super printOn: aStream.
   	aStream
   		nextPutAll: ' ';
   		print: width;
   		nextPutAll: 'x';
   		print: height;
   		nextPutAll: ' (';
   		print: cars size;
   		nextPutAll: ' cars)'
]

{ #category : 'initialization' }
PJParking >> readLines: someLines [
   	| carCells |
   	carCells := Dictionary new.
   	someLines withIndexDo: [ :line :y |
   		line withIndexDo: [ :character :x |
   			character = $# ifTrue: [ self addBollard: (PJBollard at: x @ y) ].
   			character isLetter ifTrue: [
   				(carCells at: character ifAbsentPut: [ OrderedCollection new ]) add: x @ y ] ] ].
   	carCells keysAndValuesDo: [ :name :cells |
   		self addCar: (PJCar named: name cells: cells) ]
]

{ #category : 'initialization' }
PJParking >> setWidth: aWidth height: aHeight [
   	width := aWidth.
   	height := aHeight
]

{ #category : 'accessing' }
PJParking >> width [
   	^ width
]
