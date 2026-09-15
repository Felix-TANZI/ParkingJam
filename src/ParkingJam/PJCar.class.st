Class {
	#name : 'PJCar',
	#superclass : 'Object',
	#instVars : [
		'name',
		'position',
		'length'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJCar class >> named: aCharacter at: aPoint length: anInteger [
   	^ self new
   		setName: aCharacter position: aPoint length: anInteger;
   		yourself
]

{ #category : 'initialization' }
PJCar >> setName: aCharacter position: aPoint length: anInteger [
   	name := aCharacter.
   	position := aPoint.
   	length := anInteger
]
