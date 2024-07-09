Class {
	#name : #WsTextInputApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsTextInputApp class >> rootComponentClass [

	^ WsTextFieldWithButtonsComponent 
]

{ #category : #rendering }
WsTextInputApp class >> title [

	<pharoJsSkip>
	^ 'Text Input - WebST Example'
]
