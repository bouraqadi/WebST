Class {
	#name : #WsEditableTextView,
	#superclass : #WsView,
	#category : #'WebSt-Library-Text'
}

{ #category : #rendering }
WsEditableTextView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextInputComponent 
]
