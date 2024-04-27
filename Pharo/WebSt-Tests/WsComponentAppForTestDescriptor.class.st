Class {
	#name : #WsComponentAppForTestDescriptor,
	#superclass : #Object,
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'superclass',
		'traits',
		'componentClass'
	],
	#category : #'WebSt-Tests-Support'
}

{ #category : #WsView }
WsComponentAppForTestDescriptor >> componentClass [

	^ componentClass
]

{ #category : #WsView }
WsComponentAppForTestDescriptor >> componentClass: anObject [

	componentClass := anObject
]

{ #category : #WsView }
WsComponentAppForTestDescriptor >> superclass [

	^ superclass
]

{ #category : #WsView }
WsComponentAppForTestDescriptor >> superclass: anObject [

	superclass := anObject
]

{ #category : #WsView }
WsComponentAppForTestDescriptor >> traits [

	^ traits
]

{ #category : #WsView }
WsComponentAppForTestDescriptor >> traits: anObject [

	traits := anObject
]
