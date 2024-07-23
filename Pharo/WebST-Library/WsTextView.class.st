Class {
	#name : 'WsTextView',
	#superclass : 'WsBootstrap5View',
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'rendering' }
WsTextView >> renderOuterHtmlOn: html [

	html span
		class: 'display'
]
