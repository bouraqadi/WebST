Class {
	#name : 'WsIconTextRowView',
	#superclass : 'WsBootstrap5Icons1View',
	#instVars : [
		'icon',
		'text'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsIconTextRowView >> icon [

	^ icon ifNil: ''
]

{ #category : 'accessing' }
WsIconTextRowView >> icon: anObject [

	icon := anObject
]

{ #category : 'rendering' }
WsIconTextRowView >> renderIconOn: html [

	(self renderOn: html icon: self icon) attributeAt: #role put: 'button'
]

{ #category : 'rendering' }
WsIconTextRowView >> renderOuterHtmlOn: html [

	self renderIconOn: html.
	self renderTextOn: html
]

{ #category : 'rendering' }
WsIconTextRowView >> renderTextOn: html [

	html span
		class: 'ms-1';
		attributeAt: #role put: 'button';
		with: self text
]

{ #category : 'accessing' }
WsIconTextRowView >> text [

	^ text ifNil: [ '' ]
]

{ #category : 'accessing' }
WsIconTextRowView >> text: anObject [

	text := anObject
]
