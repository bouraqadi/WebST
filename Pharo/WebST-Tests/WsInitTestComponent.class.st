Class {
	#name : 'WsInitTestComponent',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
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
	^self registryAt: #postConnect
]

{ #category : 'initialization' }
WsInitTestComponent >> preConnectInitialize [ 
	super preConnectInitialize.
	self preConnectRegistry add: self
]

{ #category : 'initialization' }
WsInitTestComponent >> preConnectRegistry [
	^self registryAt: #preConnect
]

{ #category : 'initialization' }
WsInitTestComponent >> registryAt: aSymbol [
	^window at: aSymbol ifAbsent: [window at: aSymbol put: OrderedCollection new].

]
