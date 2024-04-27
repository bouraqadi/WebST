Class {
	#name : #WsComponentAppForTest,
	#superclass : #PjWebApplication,
	#classInstVars : [
		'rootComponentClass'
	],
	#category : #'WebST-Tests-Support'
}

{ #category : #WsView }
WsComponentAppForTest class >> rootComponentClass [

	^ rootComponentClass
]

{ #category : #WsView }
WsComponentAppForTest class >> rootComponentClass: anObject [

	rootComponentClass := anObject
]
