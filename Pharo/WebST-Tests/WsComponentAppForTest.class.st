Class {
	#name : #WsComponentAppForTest,
	#superclass : #PjWebApplication,
	#classInstVars : [
		'rootComponentClass',
		'rootComponentAttributes'
	],
	#category : #'WebST-Tests-Support'
}

{ #category : #accessing }
WsComponentAppForTest class >> rootComponentAttributes [

	<pharoJsSkip>
	^ rootComponentAttributes
]

{ #category : #accessing }
WsComponentAppForTest class >> rootComponentAttributes: anAssociationArray [

	<pharoJsSkip>
	rootComponentAttributes := anAssociationArray
]

{ #category : #accessing }
WsComponentAppForTest class >> rootComponentClass [

	^ rootComponentClass
]

{ #category : #accessing }
WsComponentAppForTest class >> rootComponentClass: anObject [

	rootComponentClass := anObject
]
