Class {
	#name : #WsEditableTextApp,
	#superclass : #WsTextApp,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsEditableTextApp class >> rootComponentClass [

	^WsTextToggleEditComponent 
]
