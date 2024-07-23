Class {
	#name : 'WsTextDisplayApp',
	#superclass : 'WsSingleComponentApp',
	#category : 'WebST-Examples-Text',
	#package : 'WebST-Examples',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextDisplayApp class >> rootComponentClass [

	^ WsTextComponent
]

{ #category : 'rendering' }
WsTextDisplayApp class >> title [

	<pharoJsSkip>
	^ 'Text Display - WebST Example'
]
