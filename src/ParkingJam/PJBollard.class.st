"
PJBollard est un plot fixe du parking. Il occupe une seule case et s'affiche avec le caractere diese. 
Il repond aux memes messages que les voitures pour l'affichage (cells, character), 
ce qui permet au parking de les traiter de la meme facon. Un plot se cree avec at:.
"
Class {
	#name : 'PJBollard',
	#superclass : 'Object',
	#instVars : [
		'position'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJBollard class >> at: aPoint [
   	^ self new
   		setPosition: aPoint;
   		yourself
]

{ #category : 'accessing' }
PJBollard >> cells [
   	^ { position }
]

{ #category : 'printing' }
PJBollard >> character [
   	^ $#
]

{ #category : 'initialization' }
PJBollard >> setPosition: aPoint [
   	position := aPoint
]
