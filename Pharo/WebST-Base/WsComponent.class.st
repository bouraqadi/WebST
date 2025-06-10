Class {
	#name : 'WsComponent',
	#superclass : 'WsHtmlElement',
	#traits : 'PjTDomController',
	#classTraits : 'PjTDomController classTrait',
	#instVars : [
		'view',
		'lifecycleController'
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
WsComponent class >> newComponentWaitingForSetupHtml [
	self subclassResponsibility 
]

{ #category : 'instance creation' }
WsComponent class >> newWaitForSetup [
	"We don't have a way to setup a flag prior to instantiation, so we rely on HTML attribute"
	"This is because component creation does not rely on new operator see WsComponent class >> #new"
	"Otherwise, we would be using #basicNew like in PjFunction >> #basicNew"

	| div |
	div := document createElement: 'div'.
	div innerHTML: self newComponentWaitingForSetupHtml.
	^ div children first
]

{ #category : 'instance creation' }
WsComponent class >> newWhenReadyDo: aBlock [

	^ self new
		onReadyDo: aBlock;
		yourself
]

{ #category : 'instance creation' }
WsComponent class >> newWhenStartedDo: aBlock [

	^ self new
		onStartedDo: aBlock;
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

{ #category : 'accessing' }
WsComponent class >> waitForSetupAttributeKey [
	^#waitForSetup
]

{ #category : 'lifecycle' }
WsComponent >> connectedCallback [
	"The connectedCallback(): called each time the element is added to the document. The specification recommends that, as far as possible, developers should implement custom element setup in this callback rather than the constructor. "
	"See https://developer.mozilla.org/en-US/docs/Web/API/Web_components/Using_custom_elements#custom_element_lifecycle_callbacks"
	"PharoJS introduces a prefix to method selectors. So, we need an alias here to ensure we have the exact name."
	<jsAlias: #connectedCallback>

	self notifyDomConnectionObservers.

]

{ #category : 'accessing' }
WsComponent >> document [
	^document
]

{ #category : 'lifecycle' }
WsComponent >> externalSetupDone [
	lifecycleController externalSetupDone
]

{ #category : 'initialization' }
WsComponent >> getReady [

	view innerHTML: self shadowHtml
]

{ #category : 'initialization' }
WsComponent >> initialize [

	super initialize.
	view := self attachShadow:
		        { (#mode -> self shadowEncapsulationMode) } asJsObject.
	self reset.

]

{ #category : 'lifecycle' }
WsComponent >> isComponentClassSet [

	^ true
]

{ #category : 'accessing' }
WsComponent >> isExternalSetupRequired [

	| aString |
	aString := self
		  dataAttributeAt: self waitForSetupAttributeKey
		  ifAbsent: [ ^false ].
	^aString asLowercase == 'true'
]

{ #category : 'lifecycle' }
WsComponent >> isReady [
	^lifecycleController isReady
]

{ #category : 'lifecycle' }
WsComponent >> isStarted [
	^lifecycleController isStarted
]

{ #category : 'lifecycle' }
WsComponent >> isWaitingForExternalSetup [

	^ lifecycleController isWaitingForExternalSetup
]

{ #category : 'initialization' }
WsComponent >> lifeCycleControllerClass [

	^ WsLifecycleController
]

{ #category : 'lifecycle' }
WsComponent >> notifyIsReadyObservers [
	isReadyPort ifNil: [ ^self ].
	isReadyPort notifyWith: self.
]

{ #category : 'lifecycle' }
WsComponent >> notifyIsStartedObservers [
	isStartedPort ifNil: [ ^self ].
	isStartedPort notifyWith: self.
]

{ #category : 'lifecycle' }
WsComponent >> notifyWaitForExternalSetupObservers [ 

	isWaitingForSetupPort ifNil: [ ^ self ].
	isWaitingForSetupPort notifyWith: self
]

{ #category : 'initialization' }
WsComponent >> reset [
	"We need that the component first references the controller before 
	making the controller reference the component. Because, the controller triggers some actions on the component that require the component to know about the controller.
	See method WsLifecycleController >> #component:"

	lifecycleController := self lifeCycleControllerClass new.
	lifecycleController component: self.

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

{ #category : 'initialization' }
WsComponent >> start [

	^self
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

{ #category : 'accessing' }
WsComponent >> viewFirstElementByCssClass: cssClassName [

	^ view firstElementByCssClass: cssClassName
]

{ #category : 'accessing' }
WsComponent >> viewFirstElementByTag: tagName [

	^ view firstElementByTag: tagName
]

{ #category : 'accessing' }
WsComponent >> waitForSetupAttributeKey [

	^self class waitForSetupAttributeKey
]

{ #category : 'lifecycle' }
WsComponent >> when: otherComponent isReadyDo: aBlock [
	lifecycleController 
		when: otherComponent 
		isReadyDo: aBlock

]

{ #category : 'lifecycle' }
WsComponent >> when: otherComponent isStartedDo: aBlock [ 
	lifecycleController 
		when: otherComponent 
		isStartedDo: aBlock 
]

{ #category : 'lifecycle' }
WsComponent >> whenAll: otherComponents areReadyDo: aBlock [
	lifecycleController 
		whenAll: otherComponents 
		areReadyDo: aBlock

]

{ #category : 'lifecycle' }
WsComponent >> whenAll: otherComponents areStartedDo: aBlock [
	lifecycleController 
		whenAll: otherComponents 
		areStartedDo: aBlock

]
