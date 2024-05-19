Class {
	#name : #WsToggleEditTextView,
	#superclass : #WsView,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsToggleEditTextView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextFieldWithButtonsComponent 
]
