Class {
	#name : 'WsComponentAppForTestDescriptor',
	#superclass : 'Object',
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'superclass',
		'traits',
		'componentClass',
		'attributes'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> attributes [

	^ attributes
]

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> attributes: anObject [

	attributes := anObject
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> componentClass [

	^ componentClass
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> componentClass: anObject [

	componentClass := anObject
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> superclass [

	^ superclass
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> superclass: anObject [

	superclass := anObject
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> traits [

	^ traits
]

{ #category : 'WsView' }
WsComponentAppForTestDescriptor >> traits: anObject [

	traits := anObject
]
