"
PJParkingTest teste le parking (affichage court, dessin en texte, 
lecture d'un dessin avec fromString:, aller-retour entre texte et parking, 
coups joues, blocages, sortie par le bord, victoire et copie independante).
"
Class {
	#name : 'PJParkingTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'tests' }
PJParkingTest >> testAsciiStringOfEmptyParking [
   	| parking |
   	parking := PJParking width: 6 height: 3.
   	self
   		assert: parking asciiString lines
   		equals: #( '......' '......' '......' )
]

{ #category : 'tests' }
PJParkingTest >> testAsciiStringWithBollard [
   	| parking |
   	parking := PJParking width: 4 height: 2.
   	parking addBollard: (PJBollard at: 2 @ 1).
   	self
   		assert: parking asciiString lines
   		equals: #( '.#..' '....' )
]

{ #category : 'tests' }
PJParkingTest >> testAsciiStringWithCars [
   	| parking |
   	parking := PJParking width: 4 height: 3.
   	parking addCar: (PJHorizontalCar named: $A at: 1 @ 1 length: 2).
   	parking addCar: (PJVerticalCar named: $B at: 4 @ 2 length: 2).
   	self
   		assert: parking asciiString lines
   		equals: #( 'AA..' '...B' '...B' )
]

{ #category : 'tests' }
PJParkingTest >> testFromStringDimensions [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('.....' '.....' '.....')).
   	self assert: parking width equals: 5.
   	self assert: parking height equals: 3
]

{ #category : 'tests' }
PJParkingTest >> testFromStringReadsBollards [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('.#..' '...#')).
   	self
   		assert: parking asciiString lines
   		equals: #( '.#..' '...#' )
]

{ #category : 'tests' }
PJParkingTest >> testFromStringReadsCars [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('AA..' '...B' '...B')).
   	self assert: parking printString equals: 'a PJParking 4x3 (2 cars)'.
   	self
   		assert: parking asciiString lines
   		equals: #( 'AA..' '...B' '...B' )
]

{ #category : 'tests' }
PJParkingTest >> testFromStringRoundTrip [
   	| lines parking |
   	lines := #('AA..B.' '#...B.' 'CCC...' '..D.##' '..D...').
   	parking := PJParking fromString: (String cr join: lines).
   	self assert: parking printString equals: 'a PJParking 6x5 (4 cars)'.
   	self assert: parking asciiString lines equals: lines
]

{ #category : 'tests' }
PJParkingTest >> testIsSolvedWhenLastCarExits [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('.#' 'A.' 'A.')).
   	self deny: parking isSolved.
   	self assert: (parking play: (PJMove car: $A direction: #down)) equals: #exited.
   	self assert: parking isSolved
]

{ #category : 'tests' }
PJParkingTest >> testPlayBlockedByBollard [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('A...' 'A...' '#...')).
   	self assert: (parking play: (PJMove car: $A direction: #down)) equals: #blocked.
   	self assert: parking asciiString lines equals: #('A...' 'A...' '#...')
]

{ #category : 'tests' }
PJParkingTest >> testPlayBlockedByCar [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('AAB.' '..B.')).
   	self assert: (parking play: (PJMove car: $A direction: #right)) equals: #blocked.
   	self assert: parking asciiString lines equals: #('AAB.' '..B.')
]

{ #category : 'tests' }
PJParkingTest >> testPlayCarExitsWhenFrontIsOnEdge [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('..AA' '.B..' '.B..')).
   	self assert: (parking play: (PJMove car: $A direction: #right)) equals: #exited.
   	self assert: parking printString equals: 'a PJParking 4x3 (1 cars)'.
   	self assert: parking asciiString lines equals: #('....' '.B..' '.B..')
]

{ #category : 'tests' }
PJParkingTest >> testPlayWrongAxisIsBlocked [
   	| parking |
   	parking := PJParking fromString: (String cr join: #('....' '.AA.' '....')).
   	self assert: (parking play: (PJMove car: $A direction: #up)) equals: #blocked.
   	self assert: parking asciiString lines equals: #('....' '.AA.' '....')
]

{ #category : 'tests' }
PJParkingTest >> testPlayingOnACopyDoesNotChangeOriginal [
   	| original copy |
   	original := PJParking fromString: (String cr join: #('AA..' '...B' '...B')).
   	copy := original copy.
   	copy play: (PJMove car: $A direction: #right).
   	copy play: (PJMove car: $B direction: #down).
   	self assert: original asciiString lines equals: #('AA..' '...B' '...B').
   	self assert: copy asciiString lines equals: #('.AA.' '....' '....')
]

{ #category : 'tests' }
PJParkingTest >> testPrintStringOfEmptyParking [
   	| parking |
   	parking := PJParking width: 6 height: 4.
   	self assert: parking printString equals: 'a PJParking 6x4 (0 cars)'
]
