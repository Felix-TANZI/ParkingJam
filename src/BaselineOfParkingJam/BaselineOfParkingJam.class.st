"
BaselineOfParkingJam decrit ce qu'il faut charger pour installer le projet avec Metacello. 
Le projet contenenant un seul paquet (ParkingJam), qui regroupe le jeu et ses tests, et n'a aucune dependance externe.
"
Class {
	#name : 'BaselineOfParkingJam',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfParkingJam',
	#package : 'BaselineOfParkingJam'
}

{ #category : 'baselines' }
BaselineOfParkingJam >> baseline: spec [
   	<baseline>
   	spec for: #common do: [ spec package: 'ParkingJam' ]
]
