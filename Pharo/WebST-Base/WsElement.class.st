Class {
	#name : 'WsElement',
	#superclass : 'Object',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'rendering' }
WsElement class >> html [

	^ self new html
]

{ #category : 'rendering' }
WsElement class >> rendererClass [

	^ WsRenderer
]

{ #category : 'rendering' }
WsElement >> html [

	^ self rendererClass htmlFrom: self
]

{ #category : 'rendering' }
WsElement >> renderOn: html [

	html renderElement: self
]

{ #category : 'rendering' }
WsElement >> renderOuterHtmlOn: html [

	self subclassResponsibility
]

{ #category : 'rendering' }
WsElement >> rendererClass [
	^ self class rendererClass
]
