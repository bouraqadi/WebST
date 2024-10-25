Class {
	#name : 'WsSingleComponentAppDescriptor',
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
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> attributes [

	^ attributes
]

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> attributes: anObject [

	attributes := anObject
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> componentClass [

	^ componentClass
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> componentClass: anObject [

	componentClass := anObject
]

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> cssClasses [

	^ cssClasses
]

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> cssClasses: anObject [

	cssClasses := anObject
]

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> style [

	^ style
]

{ #category : 'accessing' }
WsSingleComponentAppDescriptor >> style: anObject [

	style := anObject
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> superclass [

	^ superclass
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> superclass: anObject [

	superclass := anObject
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> traits [

	^ traits
]

{ #category : 'WsView' }
WsSingleComponentAppDescriptor >> traits: anObject [

	traits := anObject
]
