"
I represent an external resource.
I am abstract.
My subclasses should allow representing specific kinds of resources such as CSS library, a JS library, an API access keys, a collection of fonts, images, or sounds, ...

"
Class {
	#name : 'WsLeafResource',
	#superclass : 'WsResource',
	#instVars : [
		'url',
		'integrity',
		'crossorigin',
		'referrerpolicy'
	],
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'instance creation' }
WsLeafResource class >> url: aString [
	^self new
		url: aString;
		yourself 
]

{ #category : 'instance creation' }
WsLeafResource class >> url: urlString integrity: integrityString [ 

	^ self new
		url: urlString;
		integrity: integrityString;
		yourself
]

{ #category : 'comparing' }
WsLeafResource >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ url = anObject url
]

{ #category : 'initialization' }
WsLeafResource >> crossoriginAnonymous [
	crossorigin := 'anonymous'
]

{ #category : 'comparing' }
WsLeafResource >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ url hash
]

{ #category : 'initialization' }
WsLeafResource >> initialize [
	super initialize.

	self crossoriginAnonymous.
	self noReferrer
]

{ #category : 'accessing' }
WsLeafResource >> integrity: aString [
	integrity := aString
]

{ #category : 'initialization' }
WsLeafResource >> noReferrer [
	referrerpolicy := 'no-referrer'
]

{ #category : 'rendering' }
WsLeafResource >> renderOuterHtmlOn: html [

	(self renderTagOn: html)
		attributeAt: #integrity put: integrity;
		attributeAt: #crossorigin put: crossorigin;
		attributeAt: #referrerpolicy put: referrerpolicy
]

{ #category : 'rendering' }
WsLeafResource >> renderTagOn: html [

	self subclassResponsibility
]

{ #category : 'accessing' }
WsLeafResource >> url [

	^ url
]

{ #category : 'accessing' }
WsLeafResource >> url: anObject [

	url := anObject
]
