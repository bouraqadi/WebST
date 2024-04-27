Class {
	#name : #WsTextInputView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsTextInputView >> renderOuterHtmlOn: html [

	html div
		class: 'input-group';
		with: [
			html textInput
				class: 'form-control textInput';
				placeholder: 'Your text here'.
			html render: WsSaveCancelButtonsView ]
]
