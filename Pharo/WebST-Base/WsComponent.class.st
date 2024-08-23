Class {
	#name : 'WsComponent',
	#superclass : 'WsHtmlElement',
	#traits : 'PjTDomController',
	#classTraits : 'PjTDomController classTrait',
	#instVars : [
		'view'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'instance creation' }
WsComponent class >> new [
	"HTML element classes cannot be directly instantiated "

	^ document createElement: self tagName
]

{ #category : 'class initialization' }
WsComponent class >> registerTag [

	window customElements define: self tagName with: self 
]

{ #category : 'rendering' }
WsComponent class >> renderOn: html [

	<pharoJsSkip>
	self renderOn: html with: [ : brush | ]
]

{ #category : 'rendering' }
WsComponent class >> renderOn: html with: brushBlock [

	<pharoJsSkip>
	html
		renderComponentClass: self
		with: brushBlock
]

{ #category : 'rendering' }
WsComponent class >> renderOuterHtmlOn: html with: brushBlock [

	<pharoJsSkip>
	| htmlBrush |
	htmlBrush := html tag: self tagName.
	brushBlock value: htmlBrush
]

{ #category : 'rendering' }
WsComponent class >> resources [
	<pharoJsSkip>
	^self viewClass allGlobalResources
]

{ #category : 'accessing' }
WsComponent class >> shadowHtml [

	self subclassResponsibility
]

{ #category : 'class initialization' }
WsComponent class >> tagName [

	self subclassResponsibility
]

{ #category : 'accessing' }
WsComponent class >> viewClass [

	<pharoJsSkip>
	self subclassResponsibility 
]

{ #category : 'rendering' }
WsComponent class >> writeOn: aStream attributeNameChar: aCharacter [

	<pharoJsSkip>
	aCharacter isLowercase ifTrue: [ ^aStream << aCharacter].
	aStream << $-;
	<< aCharacter asLowercase
]

{ #category : 'accessing' }
WsComponent >> document [
	^document
]

{ #category : 'initialization' }
WsComponent >> initView [

	view innerHTML: self shadowHtml
]

{ #category : 'initialization' }
WsComponent >> initialize [

	super initialize.
	self resetView
]

{ #category : 'initialization' }
WsComponent >> resetView [

	view ifNil: [
		view := self attachShadow:
			        { (#mode -> self shadowEncapsulationMode) } asJsObject ].
	self initView
]

{ #category : 'initialization' }
WsComponent >> shadowEncapsulationMode [
	"Access from javaScript outside the root shadow dom is:
	- granted when returning 'open' 
	- denied when returning 'closed'. This option can be an issue with some libraries such as Bootstrap. It makes also debugging challenging.
	See https://developer.mozilla.org/en-US/docs/Web/API/Element/attachShadow"

	^ 'open'
]

{ #category : 'initialization' }
WsComponent >> shadowHtml [

	^ self class shadowHtml
]

{ #category : 'accessing' }
WsComponent >> view [
	^view
]
