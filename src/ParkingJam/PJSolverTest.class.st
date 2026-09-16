"
PJSolverTest teste le solveur (parking deja vide, niveau simple resolu en trois coups, 
solution rejouee qui vide vraiment le parking et niveau impossible qui execute le bloc).
"
Class {
	#name : 'PJSolverTest',
	#superclass : 'TestCase',
	#category : 'ParkingJam',
	#package : 'ParkingJam'
}

{ #category : 'tests' }
PJSolverTest >> testReplayingSolutionEmptiesParking [
   	| parking solution |
   	parking := PJParking fromString: (String cr join: #('AA.B' '#..B' 'CC..' '..D.' '..D.')).
   	solution := (PJSolver on: parking) solutionIfNone: [ self fail: 'no solution found' ].
   	self deny: parking isSolved.
   	solution do: [ :move | self deny: (parking play: move) equals: #blocked ].
   	self assert: parking isSolved
]

{ #category : 'tests' }
PJSolverTest >> testSolutionOfEmptyParkingIsEmpty [
   	| parking solution |
   	parking := PJParking width: 3 height: 2.
   	solution := (PJSolver on: parking) solutionIfNone: [ #none ].
   	self assert: solution isEmpty
]

{ #category : 'tests' }
PJSolverTest >> testSolutionOfSimpleParking [
   	| parking solution |
   	parking := PJParking fromString: (String cr join: #('#AAB' '...B')).
   	solution := (PJSolver on: parking) solutionIfNone: [ #none ].
   	self assert: solution size equals: 3
]

{ #category : 'tests' }
PJSolverTest >> testUnsolvableParkingRunsBlock [
   	| parking result |
   	parking := PJParking fromString: (String cr join: #('#AA#' '....')).
   	result := (PJSolver on: parking) solutionIfNone: [ #none ].
   	self assert: result equals: #none
]
