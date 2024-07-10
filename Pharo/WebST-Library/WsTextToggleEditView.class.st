Class {
	#name : #WsTextToggleEditView,
	#superclass : #WsView,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsTextToggleEditView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextFieldWithButtonsComponent 
]
