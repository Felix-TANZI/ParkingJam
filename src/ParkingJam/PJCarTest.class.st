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
