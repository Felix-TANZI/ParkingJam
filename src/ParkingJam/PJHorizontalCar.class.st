"
PJHorizontalCar est une voiture qui va a gauche et a droite. Ses cases partent de sa position et s'etendent vers la droite.
"
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
