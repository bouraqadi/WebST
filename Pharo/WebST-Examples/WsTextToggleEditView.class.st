Class {
	#name : #WsTextToggleEditView,
	#superclass : #WsView,
	#category : #'WebST-Examples-Text'
}

{ #category : #rendering }
WsTextToggleEditView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextFieldWithButtonsComponent 
]
