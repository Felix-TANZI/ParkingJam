Class {
	#name : 'PJHorizontalCar',
	#superclass : 'PJCar',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'testing' }
PJHorizontalCar >> canMoveTowards: aDirection [
   	^ #(#left #right) includes: aDirection
]
