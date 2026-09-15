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

{ #category : 'accessing' }
PJHorizontalCar >> cells [
   	^ (0 to: length - 1) collect: [ :i | position + (i @ 0) ]
]
