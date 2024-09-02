Class {
	#name : 'WsComponentAppForTestDescriptor',
	#superclass : 'Object',
	#traits : 'TEquality',
	#classTraits : 'TEquality classTrait',
	#instVars : [
		'superclass',
		'traits',
		'componentClass',
		'attributes',
		'style',
		'cssClasses'
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

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> cssClasses [

	^ cssClasses
]

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> cssClasses: anObject [

	cssClasses := anObject
]

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> style [

	^ style
]

{ #category : 'accessing' }
WsComponentAppForTestDescriptor >> style: anObject [

	style := anObject
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
