Class {
	#name : #WsCounterApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Basic'
}

{ #category : #accessing }
WsCounterApp class >> rootComponentClass [

	^ WsCounterComponent
]
