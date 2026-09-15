Class {
	#name : 'PJCarTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

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
