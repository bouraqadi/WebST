Class {
	#name : 'WsEditableTextApp',
	#superclass : 'WsTextApp',
	#category : 'WebST-Examples-Text',
	#package : 'WebST-Examples',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsEditableTextApp class >> rootComponentClass [

	^WsTextToggleEditComponent 
]
