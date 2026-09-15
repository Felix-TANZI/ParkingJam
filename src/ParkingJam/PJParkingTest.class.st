"
PJParkingTest teste le parking (affichage court, dessin en texte, 
lecture d'un dessin avec fromString: et aller-retour entre texte et parking).
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
PJParkingTest >> testPrintStringOfEmptyParking [
   	| parking |
   	parking := PJParking width: 6 height: 4.
   	self assert: parking printString equals: 'a PJParking 6x4 (0 cars)'
]
