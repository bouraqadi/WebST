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
WsInitTestComponent >> beReady [ 
	super beReady.
	self readyRegistry add: self
]

{ #category : 'initialization' }
WsInitTestComponent >> readyRegistry [
	^self registryAt: #readyRegistry
]

{ #category : 'initialization' }
WsInitTestComponent >> registryAt: aSymbol [
	^window at: aSymbol ifAbsent: [window at: aSymbol put: OrderedCollection new].

]

{ #category : 'initialization' }
WsInitTestComponent >> reset [
	self readyRegistry removeAll.
	self startRegistry removeAll. 
	super reset.
]

{ #category : 'initialization' }
WsInitTestComponent >> start [ 
	super start.
	self startRegistry add: self
]

{ #category : 'initialization' }
WsInitTestComponent >> startRegistry [
	^self registryAt: #startRegistry
]
