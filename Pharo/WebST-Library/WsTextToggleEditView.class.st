Class {
	#name : 'WsTextToggleEditView',
	#superclass : 'WsView',
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextToggleEditView >> renderOuterHtmlOn: html [

	html
		render: WsTextComponent;
		render: WsTextFieldWithButtonsComponent 
]
