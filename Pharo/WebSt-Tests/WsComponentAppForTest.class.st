Class {
	#name : #WsComponentAppForTest,
	#superclass : #PjWebApplication,
	#classInstVars : [
		'rootComponentClass'
	],
	#category : #'WebSt-Tests-Support'
}

{ #category : #WsView }
WsComponentAppForTest class >> rootComponentClass [

	^ rootComponentClass
]

{ #category : #WsView }
WsComponentAppForTest class >> rootComponentClass: anObject [

	rootComponentClass := anObject
]
