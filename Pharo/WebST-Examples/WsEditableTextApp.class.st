Class {
	#name : #WsEditableTextApp,
	#superclass : #WsTextApp,
	#category : #'WebST-Examples-Basic'
}

{ #category : #rendering }
WsEditableTextApp class >> rootComponentClass [

	^WsTextToggleEditComponent 
]
