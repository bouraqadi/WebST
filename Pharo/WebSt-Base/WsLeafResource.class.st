"
I represent an external resource.
I am abstract.
My subclasses should allow representing specific kinds of resources such as CSS library, a JS library, an API access keys, a collection of fonts, images, or sounds, ...

"
Class {
	#name : #WsLeafResource,
	#superclass : #WsResource,
	#instVars : [
		'url',
		'integrity',
		'crossorigin'
	],
	#category : #'WebSt-Base-Resources'
}

{ #category : #'instance creation' }
WsLeafResource class >> url: aString [
	^self new
		url: aString;
		yourself 
]

{ #category : #comparing }
WsLeafResource >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ url = anObject url
]

{ #category : #initialization }
WsLeafResource >> crossoriginAnonymous [
	crossorigin := 'anonymous'
]

{ #category : #comparing }
WsLeafResource >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ url hash
]

{ #category : #accessing }
WsLeafResource >> integrity: aString [
	integrity := aString
]

{ #category : #rendering }
WsLeafResource >> renderOuterHtmlOn: html [

	(self renderTagOn: html)
		attributeAt: #integrity put: integrity;
		attributeAt: #crossorigin put: crossorigin
]

{ #category : #rendering }
WsLeafResource >> renderTagOn: html [

	self subclassResponsibility
]

{ #category : #accessing }
WsLeafResource >> url [

	^ url
]

{ #category : #accessing }
WsLeafResource >> url: anObject [

	url := anObject
]
