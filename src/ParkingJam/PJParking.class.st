"
PJParking est la grille du jeu. Il connait sa largeur, sa hauteur, 
ses voitures et ses plots. Il sait se dessiner en texte avec asciiString, une ligne par rangee (point pour une case vide, diese pour un plot, lettre pour une voiture). 
Il joue les coups avec play: qui repond moved si la voiture avance, exited si elle sort par le bord et blocked si le coup est impossible (mauvais axe ou case occupee). 
La partie est gagnee quand il ne reste plus de voiture (isSolved). Une copie du parking a ses propres voitures, ce qui permet d'essayer des coups sans modifier l'original. 
Ses messages principaux sont (width, height, addCar:, addBollard:, asciiString, play:, isSolved). Un parking se cree vide avec width:height: ou a partir d'un dessin avec fromString:.
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

{ #category : 'accessing' }
PJParking >> carNamed: aCharacter [
   	^ cars detect: [ :each | each name = aCharacter ]
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

{ #category : 'testing' }
PJParking >> includes: aPoint [
   	^ (aPoint x between: 1 and: width) and: [ aPoint y between: 1 and: height ]
]

{ #category : 'initialization' }
PJParking >> initialize [
   	super initialize.
   	cars := OrderedCollection new.
   	bollards := OrderedCollection new
]

{ #category : 'testing' }
PJParking >> isFreeAt: aPoint [
   	^ self elements noneSatisfy: [ :each | each cells includes: aPoint ]
]

{ #category : 'testing' }
PJParking >> isSolved [
   	^ cars isEmpty
]

{ #category : 'playing' }
PJParking >> play: aMove [
   	| car target |
   	car := self carNamed: aMove carName.
   	(car canMoveTowards: aMove direction) ifFalse: [ ^ #blocked ].
   	target := car frontCellTowards: aMove direction.
   	(self includes: target) ifFalse: [
   		self removeCar: car.
   		^ #exited ].
   	(self isFreeAt: target) ifFalse: [ ^ #blocked ].
   	car moveTowards: aMove direction.
   	^ #moved
]

{ #category : 'copying' }
PJParking >> postCopy [
   	super postCopy.
   	cars := cars collect: [ :each | each copy ].
   	bollards := bollards copy
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

{ #category : 'removing' }
PJParking >> removeCar: aCar [
   	cars remove: aCar
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
