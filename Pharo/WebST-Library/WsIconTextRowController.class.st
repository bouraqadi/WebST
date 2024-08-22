Class {
	#name : 'WsIconTextRowController',
	#superclass : 'PjDomController',
	#instVars : [
		'iconElement',
		'textElement'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'instance creation' }
WsIconTextRowController class >> container: domElement [
	^self new
		container: domElement;
		yourself
]

{ #category : 'initialization' }
WsIconTextRowController >> container: domElement [
	self iconElement: (domElement querySelector: 'i').
	self textElement: (domElement querySelector: 'span')
]

{ #category : 'accessing' }
WsIconTextRowController >> icon: cssClassString [

	self iconElement classList add: cssClassString
]

{ #category : 'accessing' }
WsIconTextRowController >> iconElement [

	^ iconElement
]

{ #category : 'accessing' }
WsIconTextRowController >> iconElement: anObject [

	iconElement := anObject
]

{ #category : 'accessing' }
WsIconTextRowController >> text: aString [

	aString ifNil: [ ^self hide: self textElement ].
	self textElement textContent: aString.
	self show: self textElement
]

{ #category : 'accessing' }
WsIconTextRowController >> textElement [

	^ textElement
]

{ #category : 'accessing' }
WsIconTextRowController >> textElement: anObject [

	textElement := anObject
]
