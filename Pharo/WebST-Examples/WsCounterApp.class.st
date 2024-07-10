Class {
	#name : #WsCounterApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Misc'
}

{ #category : #accessing }
WsCounterApp class >> rootComponentClass [

	^ WsCounterComponent
]
