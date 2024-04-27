Class {
	#name : #WsTextApp,
	#superclass : #PjWebApplication,
	#traits : 'WsTComponentApp',
	#classTraits : 'WsTComponentApp classTrait',
	#category : #'WebSt-Examples-Basic'
}

{ #category : #rendering }
WsTextApp class >> rootComponentClass [

	^WsTextComponent 
]

{ #category : #initialization }
WsTextApp >> initRootComponent [

	^ self rootComponent text: 'I love Smalltalk!'
]
