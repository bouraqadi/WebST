Class {
	#name : #WsTextToggleEditApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsTextToggleEditApp class >> rootComponentClass [

	^ WsTextToggleEditComponent 
]

{ #category : #rendering }
WsTextToggleEditApp class >> title [

	<pharoJsSkip>
	^ 'Editable Text - WebST Example'
]
