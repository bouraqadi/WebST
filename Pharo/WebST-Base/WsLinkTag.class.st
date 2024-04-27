Class {
	#name : #WsLinkTag,
	#superclass : #WATagBrush,
	#category : #'WebST-Base-Views'
}

{ #category : #relationship }
WsLinkTag >> beStylesheet [
	self attributes at: 'rel' put: 'stylesheet'
]

{ #category : #testing }
WsLinkTag >> isClosed [ 
	^true
]

{ #category : #accessing }
WsLinkTag >> tag [

	^#link
]

{ #category : #accessing }
WsLinkTag >> url: aString [

	self attributes at: 'href' put: aString
]
