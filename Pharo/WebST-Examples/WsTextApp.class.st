Class {
	#name : #WsTextApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Basic'
}

{ #category : #rendering }
WsTextApp class >> rootComponentClass [

	^WsTextComponent 
]

{ #category : #initialization }
WsTextApp >> initRootComponent [

	^ self rootComponent text: 'I love Smalltalk!'
]
