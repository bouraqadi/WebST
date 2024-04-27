Class {
	#name : #WsTextView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsTextView >> renderOuterHtmlOn: html [

	html span
		class: 'display';
		style: 'display:inline-block;min-width:100px; min-height: 1.5em;'
]
