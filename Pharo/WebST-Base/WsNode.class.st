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
