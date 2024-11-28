"
I represent an external resource.
I am abstract.
My subclasses should allow representing specific kinds of resources such as CSS library, a JS library, an API access keys, a collection of fonts, images, or sounds, ...

"
Class {
	#name : 'WsLeafResource',
	#superclass : 'WsResource',
	#instVars : [
		'path',
		'integrity',
		'crossorigin',
		'referrerpolicy'
	],
	#category : 'WebST-Base-Resources',
	#package : 'WebST-Base',
	#tag : 'Resources'
}

{ #category : 'instance creation' }
WsLeafResource class >> fixedPathString: aString [

	^ self new
		  fixedPathString: aString;
		  yourself
]

{ #category : 'instance creation' }
WsLeafResource class >> fixedPathString: urlString integrity: integrityString [

	^ self new
		  fixedPathString: urlString;
		  integrity: integrityString;
		  yourself
]

{ #category : 'instance creation' }
WsLeafResource class >> pathString: aString [

	^ self new
		  pathString: aString;
		  yourself
]

{ #category : 'instance creation' }
WsLeafResource class >> pathString: urlString integrity: integrityString [ 

	^ self new
		pathString: urlString;
		integrity: integrityString;
		yourself
]

{ #category : 'comparing' }
WsLeafResource >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self basicPathString = anObject basicPathString
]

{ #category : 'accessing' }
WsLeafResource >> basicPathString [

	path ifNil: [ ^nil ].
	^ path basicPathString
]

{ #category : 'initialization' }
WsLeafResource >> beCrossoriginAnonymous [
	crossorigin := 'anonymous'
]

{ #category : 'initialization' }
WsLeafResource >> beNoReferrer [
	referrerpolicy := 'no-referrer'
]

{ #category : 'accessing' }
WsLeafResource >> fixedPathString: aString [

	path := WsFixedResourcePath pathString: aString
]

{ #category : 'comparing' }
WsLeafResource >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self basicPathString hash
]

{ #category : 'initialization' }
WsLeafResource >> initialize [

	super initialize.
	self beCrossoriginAnonymous.
	self beNoReferrer
]

{ #category : 'accessing' }
WsLeafResource >> integrity: aString [
	integrity := aString
]

{ #category : 'accessing' }
WsLeafResource >> pathString [

	path ifNil: [ ^nil ].
	^ path pathString
]

{ #category : 'accessing' }
WsLeafResource >> pathString: aString [

	path := WsResourcePath pathString: aString
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
