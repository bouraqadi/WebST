Class {
	#name : 'WsLifecycleTestComponent',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsLifecycleTestComponent >> basicSetIsReady [
	^super setIsReady
]

{ #category : 'initialization' }
WsLifecycleTestComponent >> setIsReady [
	^self
]
