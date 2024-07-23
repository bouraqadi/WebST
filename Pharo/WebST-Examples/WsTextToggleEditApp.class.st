Class {
	#name : 'WsTextToggleEditApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-Text',
	#package : 'WebST-Examples',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextToggleEditApp class >> rootComponentClass [

	^ WsTextToggleEditComponent 
]

{ #category : 'rendering' }
WsTextToggleEditApp class >> title [

	<pharoJsSkip>
	^ 'Editable Text - WebST Example'
]
