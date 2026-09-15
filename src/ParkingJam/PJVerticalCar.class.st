Class {
	#name : 'PJVerticalCar',
	#superclass : 'PJCar',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'testing' }
PJVerticalCar >> canMoveTowards: aDirection [
   	^ #(#up #down) includes: aDirection
]

{ #category : 'accessing' }
PJVerticalCar >> cells [
   	^ (0 to: length - 1) collect: [ :i | position + (0 @ i) ]
]
