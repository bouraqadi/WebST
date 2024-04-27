Class {
	#name : #WsEditableTextView,
	#superclass : #WsView,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsEditableTextView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextInputComponent 
]
