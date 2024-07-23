Class {
	#name : 'WsTextInputApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-Text',
	#package : 'WebST-Examples',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextInputApp class >> rootComponentClass [

	^ WsTextFieldWithButtonsComponent 
]

{ #category : 'rendering' }
WsTextInputApp class >> title [

	<pharoJsSkip>
	^ 'Text Input - WebST Example'
]
