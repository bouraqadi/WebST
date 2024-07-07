Class {
	#name : #WsTextView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-Text'
}

{ #category : #rendering }
WsTextView >> renderOuterHtmlOn: html [

	html span
		class: 'display'
]
