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
	"The crossorigin attribute, valid on the <audio>, <img>, <link>, <script>, and <video> elements, provides support for CORS, defining how the element handles cross-origin requests.
	
	 #anonymous = Request uses CORS headers and credentials flag is set to 'same-origin'. There is no exchange of user credentials via cookies, client-side TLS certificates or HTTP authentication, unless destination is the same origin.

	See https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/crossorigin
"
	crossorigin := 'anonymous'
]

{ #category : 'initialization' }
WsLeafResource >> beNoReferrer [
	"The referrerPolicy property of the HTMLScriptElement interface reflects the HTML referrerpolicy of the <script> element, which defines how the referrer is set when fetching the script and any scripts it imports.
	
	See https://developer.mozilla.org/en-US/docs/Web/API/HTMLScriptElement/referrerPolicy"
	
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
	"The integrity property of the HTMLScriptElement interface is a string that contains inline metadata that a browser can use to verify that a fetched resource has been delivered without unexpected manipulation.
	
	See https://developer.mozilla.org/en-US/docs/Web/API/HTMLScriptElement/integrity"
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
	"#crossorigin attribute removed to allow resource use in a local HTML file, typically for single component tests. See https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Attributes/crossorigin

	#integrity attribute is removed because resource is not eligible for integrity checks, since  crossorigin attribute is removed. Itegrity check can be done only for resources that are either CORS-enabled or same-origin. See https://developer.mozilla.org/en-US/docs/Web/API/HTMLScriptElement/integrity"

	(self renderTagOn: html)
"		attributeAt: #integrity put: integrity;
		attributeAt: #crossorigin put: crossorigin;"
		attributeAt: #referrerpolicy put: referrerpolicy
]

{ #category : 'rendering' }
WsLeafResource >> renderTagOn: html [

	self subclassResponsibility
]
