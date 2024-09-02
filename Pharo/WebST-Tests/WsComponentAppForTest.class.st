Class {
	#name : 'WsComponentAppForTest',
	#superclass : 'WsSingleComponentApp',
	#classInstVars : [
		'rootComponentClass',
		'rootComponentAttributes',
		'rootComponentStyle',
		'rootComponentCssClasses'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentAttributes [

	<pharoJsSkip>
	^ rootComponentAttributes
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentAttributes: anAssociationArray [

	<pharoJsSkip>
	rootComponentAttributes := anAssociationArray
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentClass [

	^ rootComponentClass
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentClass: anObject [

	rootComponentClass := anObject
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentCssClasses [

	^ rootComponentCssClasses
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentCssClasses: anObject [

	rootComponentCssClasses := anObject
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentStyle [

	^ rootComponentStyle
]

{ #category : 'accessing' }
WsComponentAppForTest class >> rootComponentStyle: anObject [

	rootComponentStyle := anObject
]
