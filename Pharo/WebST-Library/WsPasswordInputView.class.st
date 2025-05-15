Class {
	#name : 'WsPasswordInputView',
	#superclass : 'WsBootstrap5View',
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsPasswordInputView >> renderOuterHtmlOn: html [

	html div
		class: 'input-group';
		with: [
			html passwordInput class: 'form-control border border-end-0'.
			html render: WsShowHideToggleComponent ]
]
