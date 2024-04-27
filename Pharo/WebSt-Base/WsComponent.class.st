Class {
	#name : #WsComponent,
	#superclass : #WsHtmlElement,
	#traits : 'PjTDomController',
	#classTraits : 'PjTDomController classTrait',
	#instVars : [
		'view'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : #'WebSt-Base-Components'
}

{ #category : #accessing }
WsComponent class >> addAllComponentClassesTo: classes [

	<pharoJsSkip>
	(classes includes: self) ifTrue: [ ^ self ].
	classes add: self.
	self subComponentClasses do: [ :each |
		each addAllComponentClassesTo: classes ]
]

{ #category : #'instance creation' }
WsComponent class >> new [
	"HTML element classes cannot be directly instantiated "

	^ document createElement: self tagName
]

{ #category : #'class initialization' }
WsComponent class >> registerTag [

	window customElements define: self tagName with: self 
]

{ #category : #rendering }
WsComponent class >> renderOn: html [

	<pharoJsSkip>
	self renderOn: html style: nil
]

{ #category : #rendering }
WsComponent class >> renderOn: html style: cssStyleString [

	<pharoJsSkip>
	html renderComponentClass: self  style: cssStyleString
]

{ #category : #rendering }
WsComponent class >> renderOuterHtmlOn: html style: cssStyleString [

	<pharoJsSkip>
	| htmlBrush |
	htmlBrush := html tag: self tagName.
cssStyleString ifNil: [ ^self ].
	htmlBrush style: cssStyleString
]

{ #category : #rendering }
WsComponent class >> resources [
	<pharoJsSkip>
	^self viewClass allGlobalResources
]

{ #category : #accessing }
WsComponent class >> shadowHtml [

	self subclassResponsibility
]

{ #category : #accessing }
WsComponent class >> subComponentClasses [

	<pharoJsSkip>
	^ self viewClass referencedClasses select: [ :each |
		  each inheritsFrom: WsComponent ]
]

{ #category : #'class initialization' }
WsComponent class >> tagName [

	self subclassResponsibility
]

{ #category : #accessing }
WsComponent class >> title [

	<pharoJsSkip>
	^ self name
]

{ #category : #accessing }
WsComponent class >> viewClass [

	<pharoJsSkip>
	self subclassResponsibility 
]

{ #category : #accessing }
WsComponent >> document [
	^document
]

{ #category : #initialization }
WsComponent >> initView [

	view innerHTML: self shadowHtml
]

{ #category : #initialization }
WsComponent >> initialize [

	super initialize.
	self resetView
]

{ #category : #initialization }
WsComponent >> resetView [

	view ifNil: [
		view := self attachShadow:
			        { (#mode -> self shadowEncapsulationMode) } asJsObject ].
	self initView
]

{ #category : #initialization }
WsComponent >> shadowEncapsulationMode [
	"Access from javaScript outside the root shadow dom is:
	- granted when returning 'open' 
	- denied when returning 'closed'. This option can be an issue with some libraries such as Bootstrap. It makes also debugging challenging.
	See https://developer.mozilla.org/en-US/docs/Web/API/Element/attachShadow"

	^ 'open'
]

{ #category : #initialization }
WsComponent >> shadowHtml [

	^ self class shadowHtml
]

{ #category : #accessing }
WsComponent >> view [
	^view
]
