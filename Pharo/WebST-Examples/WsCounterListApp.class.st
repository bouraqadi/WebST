Class {
	#name : #WsCounterListApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-List'
}

{ #category : #rendering }
WsCounterListApp class >> rootComponentClass [

	^ WsCounterListComponent 
]

{ #category : #rendering }
WsCounterListApp class >> title [

	<pharoJsSkip>
	^ 'Counters List WebST Example'
]

{ #category : #initialization }
WsCounterListApp >> initRootComponent [

	#(0 -10 42) do: [: each | 
	self rootComponent addCounter: each]
]
