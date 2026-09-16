Class {
	#name : 'PJSolver',
	#superclass : 'Object',
	#instVars : [
		'parking'
	],
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'instance creation' }
PJSolver class >> on: aParking [
   	^ self new
   		setParking: aParking;
   		yourself
]

{ #category : 'initialization' }
PJSolver >> setParking: aParking [
   	parking := aParking
]

{ #category : 'solving' }
PJSolver >> solutionIfNone: aBlock [
   	| queue seen |
   	queue := OrderedCollection with: parking -> OrderedCollection new.
   	seen := Set with: parking asciiString.
   	[ queue isEmpty ] whileFalse: [
   		| current state moves |
   		current := queue removeFirst.
   		state := current key.
   		moves := current value.
   		state isSolved ifTrue: [ ^ moves ].
   		state possibleMoves do: [ :move |
   			| next |
   			next := state copy.
   			((next play: move) ~= #blocked and: [ (seen includes: next asciiString) not ])
   				ifTrue: [
   					seen add: next asciiString.
   					queue add: next -> (moves copyWith: move) ] ] ].
   	^ aBlock value
]
