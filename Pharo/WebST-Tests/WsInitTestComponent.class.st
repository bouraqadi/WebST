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
WsInitTestComponent >> initRegistry [
	^window at: #initRegistry ifAbsent: [window at: #initRegistry put: OrderedCollection new].

]

{ #category : 'initialization' }
WsInitTestComponent >> postConnectInitialize [ 
	super postConnectInitialize.
	self initRegistry add: self
]
