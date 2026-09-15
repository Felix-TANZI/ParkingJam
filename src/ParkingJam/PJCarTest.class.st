"
PJCarTest teste les voitures (directions permises, cases occupees, case devant, deplacements et affichage).
"
Class {
	#name : 'PJCarTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'tests' }
PJCarTest >> testCarName [
   	| car |
   	car := PJHorizontalCar named: $A at: 1 @ 1 length: 2.
   	self assert: car name equals: $A
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarCanMoveRight [
   	| car |
   	car := PJHorizontalCar named: $A at: 1 @ 1 length: 2.
   	self assert: (car canMoveTowards: #right)
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarCannotMoveUp [
   	| car |
   	car := PJHorizontalCar named: $A at: 1 @ 1 length: 2.
   	self deny: (car canMoveTowards: #up)
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarCells [
   	| car |
   	car := PJHorizontalCar named: $A at: 2 @ 3 length: 3.
   	self assert: car cells equals: { 2 @ 3 . 3 @ 3 . 4 @ 3 }
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarFrontCellTowardsLeft [
   	| car |
   	car := PJHorizontalCar named: $A at: 2 @ 3 length: 2.
   	self assert: (car frontCellTowards: #left) equals: 1 @ 3
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarFrontCellTowardsRight [
   	| car |
   	car := PJHorizontalCar named: $A at: 2 @ 3 length: 2.
   	self assert: (car frontCellTowards: #right) equals: 4 @ 3
]

{ #category : 'tests' }
PJCarTest >> testHorizontalCarMovesRight [
   	| car |
   	car := PJHorizontalCar named: $A at: 2 @ 3 length: 2.
   	car moveTowards: #right.
   	self assert: car cells equals: { 3 @ 3 . 4 @ 3 }
]

{ #category : 'tests' }
PJCarTest >> testPrintString [
	| car |
	car := PJHorizontalCar named: $A at: 2 @ 3 length: 2.
	self assert: car printString equals: 'a PJHorizontalCar A at (2@3) length 2'
]

{ #category : 'tests' }
PJCarTest >> testVerticalCarCanMoveUp [
   	| car |
   	car := PJVerticalCar named: $B at: 2 @ 2 length: 3.
   	self assert: (car canMoveTowards: #up)
]

{ #category : 'tests' }
PJCarTest >> testVerticalCarCells [
   	| car |
   	car := PJVerticalCar named: $B at: 2 @ 3 length: 2.
   	self assert: car cells equals: { 2 @ 3 . 2 @ 4 }
]

{ #category : 'tests' }
PJCarTest >> testVerticalCarFrontCellTowardsDown [
   	| car |
   	car := PJVerticalCar named: $B at: 2 @ 3 length: 2.
   	self assert: (car frontCellTowards: #down) equals: 2 @ 5
]

{ #category : 'tests' }
PJCarTest >> testVerticalCarMovesUp [
   	| car |
   	car := PJVerticalCar named: $B at: 2 @ 3 length: 2.
   	car moveTowards: #up.
   	self assert: car cells equals: { 2 @ 2 . 2 @ 3 }
]
