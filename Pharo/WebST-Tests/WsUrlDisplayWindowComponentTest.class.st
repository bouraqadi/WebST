Class {
	#name : #WsUrlDisplayWindowComponentTest,
	#superclass : #WsWindowComponentTest,
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsUrlDisplayWindowComponentTest class >> componentClass [

	^ WsUrlDisplayWindowComponent
]

{ #category : #accessing }
WsUrlDisplayWindowComponentTest class >> dataAttributes [

	^ super dataAttributes
	  ,
	  { (#url
	   -> 'https://youtu.be/EskqBFtYpfs?si=elJtb7Y12Uc8BXIs') }
]

{ #category : #asserting }
WsUrlDisplayWindowComponentTest >> assertCustomAttributesApplied [

	self
		assert: self object data
		equals: (self dataAttributesDict at: #url)
]

{ #category : #asserting }
WsUrlDisplayWindowComponentTest >> assertDefaultAttributesApplied [

	self
		  assert: self object data
		  equals: self rootComponentClass defaultUrl
]

{ #category : #accessing }
WsUrlDisplayWindowComponentTest >> object [
	^shadowRoot querySelector: 'object'
]
