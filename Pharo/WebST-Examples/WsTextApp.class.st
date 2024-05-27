Class {
	#name : #WsTextApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTSingleComponentApp',
	#classTraits : 'WsTSingleComponentApp classTrait',
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
