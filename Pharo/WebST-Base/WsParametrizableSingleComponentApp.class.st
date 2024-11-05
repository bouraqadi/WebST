Class {
	#name : 'WsParametrizableSingleComponentApp',
	#superclass : 'WsSingleComponentApp',
	#classInstVars : [
		'rootComponentClass',
		'rootComponentAttributes',
		'rootComponentStyle',
		'rootComponentCssClasses'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> componentClass [

	^ rootComponentClass
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentAttributes [

	<pharoJsSkip>
	^ rootComponentAttributes
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentAttributes: anAssociationArray [

	<pharoJsSkip>
	rootComponentAttributes := anAssociationArray
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentClass: anObject [

	rootComponentClass := anObject
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentCssClasses [

	^ rootComponentCssClasses
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentCssClasses: anObject [

	rootComponentCssClasses := anObject
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentStyle [

	^ rootComponentStyle
]

{ #category : 'accessing' }
WsParametrizableSingleComponentApp class >> rootComponentStyle: anObject [

	rootComponentStyle := anObject
]
