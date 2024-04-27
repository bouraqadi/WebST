Class {
	#name : #WsTitle,
	#superclass : #WAHtmlElement,
	#instVars : [
		'text'
	],
	#category : #'WebSt-Base-Views'
}

{ #category : #testing }
WsTitle >> isClosed [

"Always use 2 tags: one for openning and one for closing. Otherwise the page does not display correctly on some web browser"
	^ false
]

{ #category : #rendering }
WsTitle >> renderInnerHtmlOn: html [

	html text: self text
]

{ #category : #accessing }
WsTitle >> tag [

	^#title
]

{ #category : #accessing }
WsTitle >> text [

	^ text
]

{ #category : #accessing }
WsTitle >> text: anObject [

	text := anObject
]
