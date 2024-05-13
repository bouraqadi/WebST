Class {
	#name : #WsPasswordInputView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsPasswordInputView >> renderOuterHtmlOn: html [

	html div
		class: 'input-group';
		with: [
			html textInput
				class: 'form-control textInput';
				placeholder: 'Your text here'.
			html render: WsSaveCancelButtonsView ]
]
