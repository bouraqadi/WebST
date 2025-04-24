Class {
	#name : 'WsInitTestComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#classVars : [
		'PostConnectRegistry',
		'PreConnectRegistry'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsInitTestComponent class >> viewClass [
	<pharoJsSkip>
	^WsInitTestView 
]

{ #category : 'initialization' }
WsInitTestComponent >> postConnectInitialize [ 
	super postConnectInitialize.
	self postConnectRegistry add: self
]

{ #category : 'initialization' }
WsInitTestComponent >> postConnectRegistry [
	^PostConnectRegistry ifNil: [ PostConnectRegistry := OrderedCollection new ]
]

{ #category : 'initialization' }
WsInitTestComponent >> preConnectInitialize [ 
	super preConnectInitialize.
	self preConnectRegistry add: self
]

{ #category : 'initialization' }
WsInitTestComponent >> preConnectRegistry [
	^PreConnectRegistry ifNil: [ PreConnectRegistry := OrderedCollection new ]
]

{ #category : 'initialization' }
WsInitTestComponent >> resetRegistries [
	PreConnectRegistry := nil.
	PostConnectRegistry := nil
]
