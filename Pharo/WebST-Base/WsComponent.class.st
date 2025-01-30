Class {
	#name : 'WsComponent',
	#superclass : 'WsHtmlElement',
	#traits : 'PjTDomController',
	#classTraits : 'PjTDomController classTrait',
	#instVars : [
		'view',
		'isComponentReady'
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

{ #category : 'instance creation' }
WsComponent class >> newOnComponentReadyDo: aBlock [

	^ self new
		onComponentReadyDo: aBlock;
		yourself
]

{ #category : 'demoing' }
WsComponent class >> playground [

	<pharoJsSkip>
	^WsSingleComponentAppGenerator playgroundFor: self
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

{ #category : 'initialization' }
WsComponent >> connectedCallback [
	"The connectedCallback(): called each time the element is added to the document. The specification recommends that, as far as possible, developers should implement custom element setup in this callback rather than the constructor. "
	"See https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_element_lifecycle_callbacks"
	"PharoJS introduces a prefix to method selectors. So, we need an alias here to ensure we have the exact name."
	<jsAlias: #connectedCallback>

	self notifyDomConnectionObservers.
	self initializeOnDomConnection.
	self notifyComponentReadyObservers.
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
WsComponent >> initializeOnDomConnection [
	"Called by #connectedCallback once the component is attached to the DOM"
	
	self resetView 
]

{ #category : 'DOM connection observing' }
WsComponent >> installConnectedNotificationTrigger [
	"Web Compoments have a callback that we use to trigger notifications.
	See WsComponent >> #connectedCallback"
	
	^self
]

{ #category : 'observing lifecycle' }
WsComponent >> isComponentReady [
	^isComponentReady ifNil: [ isComponentReady := false ]
]

{ #category : 'observing lifecycle' }
WsComponent >> notifyComponentReadyObservers [
	isComponentReady := true.
	isComponentReadyPort ifNil: [ ^self ].
	isComponentReadyPort notifyWith: self.

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

{ #category : 'accessing' }
WsComponent >> viewChildAt: elementId [

	^ view elementAt: elementId
]

{ #category : 'accessing' }
WsComponent >> viewFirstComponent: componentClass [

	^ view firstComponent: componentClass
]
