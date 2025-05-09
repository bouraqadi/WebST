Class {
	#name : 'WsBasicComponentForInitTest',
	#superclass : 'WsComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsBasicComponentForInitTest class >> viewClass [
	<pharoJsSkip>
	^WsBasicViewForInitTest 
]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> beReady [ 
	super beReady.
	self readyRegistry add: self
]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> readyRegistry [
	^self registryAt: #readyRegistry
]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> registryAt: aSymbol [
	^window at: aSymbol ifAbsent: [window at: aSymbol put: OrderedCollection new].

]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> reset [
	self readyRegistry removeAll.
	self startRegistry removeAll. 
	super reset.
]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> start [ 
	super start.
	self startRegistry add: self
]

{ #category : 'initialization' }
WsBasicComponentForInitTest >> startRegistry [
	^self registryAt: #startRegistry
]
