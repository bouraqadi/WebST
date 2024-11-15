"
Placeholder for JS class Node. See class-side method #javascriptName
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
