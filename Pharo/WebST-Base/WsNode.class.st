"
Placeholder for JS class Node. See class-side method #javascriptName.

The #onConnectedDo:, and #notifyDomConnectionObservers methods allows observing connection to DOM for any HTML element.
The actual support to these observation is provided by the #installConnectedNotificationTrigger method.

The WsNode >> #installConnectedNotificationTrigger implements a hack to install a connection trigger for basic basic HTML elements.
This method is overriden in WsHtmlElement since browsers provide a callback for custom HTML elements connection.
"
Class {
	#name : 'WsNode',
	#superclass : 'Object',
	#instVars : [
		'isConnectedPort',
		'parentNode'
	],
	#pools : [
		'PjBrowserGlobals'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'pharoJs support' }
WsNode class >> javascriptName [

	<pharoJsSkip>
	^ #Node
]

{ #category : 'accessing children' }
WsNode >> allComponents: componentClass [

	^ self allElementsByTag: componentClass tagName
]

{ #category : 'accessing children' }
WsNode >> allElementsByCssClass: cssClassName [

	^ self querySelectorAll: '.' , cssClassName
]

{ #category : 'accessing children' }
WsNode >> allElementsByTag: tagName [

	^ self querySelectorAll: tagName
]

{ #category : 'accessing children' }
WsNode >> elementAt: id [
	^self querySelector: '#', id
]

{ #category : 'accessing children' }
WsNode >> firstComponent: componentClass [

	^ self firstElementByTag: componentClass tagName
]

{ #category : 'accessing children' }
WsNode >> firstElementByCssClass: cssClassName [

	^ self querySelector: '.' , cssClassName
]

{ #category : 'accessing children' }
WsNode >> firstElementByTag: tagName [

	^ self querySelector: tagName
]

{ #category : 'DOM connection observing' }
WsNode >> installConnectedNotificationTrigger [
	"HTML does not provide any support for detecting a connection to DOM"
	"Workaround: Rely on an animation event sent to a dedicated empty element"
	"Esnure we don't have duplicate triggering"
	| triggerCssClassName triggerStyle trigger |
	triggerCssClassName := #webStConnectedNotificationTrigger.
	(self firstElementByCssClass: triggerCssClassName) ifNotNil: [ ^self ].
	triggerStyle := document createElement: 'style'.
	triggerStyle textContent: '
	.',triggerCssClassName,'{
		width: 0 !important;
		height: 0 !important;
		animation-name: empty;
		animation-duration: 0s;
		animation-iteration-count: 0;
	}
	@keyframes empty{
	}'.
	trigger := document createElement: 'span'.
	trigger className: triggerCssClassName.
	trigger addEventListener: #animationstart block: [self notifyDomConnectionObservers].
	self
		append: triggerStyle;
		append: trigger
]

{ #category : 'DOM connection observing' }
WsNode >> isConnected [
	"The read-only isConnected property of the Node interface returns a boolean indicating whether the node is connected (directly or indirectly) to a Document object."
	"See https://developer.mozilla.org/en-US/docs/Web/API/Node/isConnected"
	<javascript: 'return this.isConnected'>
	
	^self instVarNamed: #isConnected
]

{ #category : 'DOM connection observing' }
WsNode >> isConnectedPort [
	^isConnectedPort ifNil: [ isConnectedPort := HyCollectionPort new ]
]

{ #category : 'DOM connection observing' }
WsNode >> notifyDomConnectionObservers [
	isConnectedPort ifNil: [ ^self ].
	isConnectedPort notify
]

{ #category : 'DOM connection observing' }
WsNode >> onConnectedDo: aBlock [
	"Request to perform aBlock when connected to the DOM tree"
	
	self isConnected ifTrue: [ ^aBlock value ].
	self isConnectedPort => aBlock.
	self installConnectedNotificationTrigger
]

{ #category : 'accessing children' }
WsNode >> parentNode [
	^parentNode 
]
