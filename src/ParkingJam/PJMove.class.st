"
PJMove represente un coup du joueur. Il reunit le nom d'une 
voiture et une direction (up, down, left ou right). Un coup ne fait rien lui meme, 
c'est le parking qui le joue avec play:. Un coup se cree avec car:direction:.
"
Class {
	#name : 'PJMove',
	#superclass : 'Object',
	#instVars : [
		'carName',
		'direction'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJMove class >> car: aCharacter direction: aSymbol [
   	^ self new
   		setCarName: aCharacter direction: aSymbol;
   		yourself
]

{ #category : 'accessing' }
PJMove >> carName [
   	^ carName
]

{ #category : 'accessing' }
PJMove >> direction [
   	^ direction
]

{ #category : 'printing' }
PJMove >> printOn: aStream [
   	super printOn: aStream.
   	aStream
   		nextPutAll: ' ';
   		nextPut: carName;
   		nextPutAll: ' ';
   		nextPutAll: direction
]

{ #category : 'initialization' }
PJMove >> setCarName: aCharacter direction: aSymbol [
   	carName := aCharacter.
   	direction := aSymbol
]
