Class {
	#name : 'WsTextApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-Text',
	#package : 'WebST-Examples',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextApp class >> rootComponentClass [

	^WsTextComponent 
]

{ #category : 'initialization' }
WsTextApp >> initRootComponent [

	^ self rootComponent text: 'I love Smalltalk!'
]
