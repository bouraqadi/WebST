Class {
	#name : 'WsComponentForLifecycleTest',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'canBeReady',
		'canStart'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsComponentForLifecycleTest >> beReadyThenNotifyObservers [
	canBeReady ifFalse: [ ^self ].
	^super beReadyThenNotifyObservers 
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> reset [ 
	canBeReady := false.
	canStart := false.
	super reset.

]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanBeReady [
	canBeReady := true.
	self beReadyThenNotifyObservers
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanBeReadyAndStart [
	self 
		setCanBeReady; 
		setCanStart
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanStart [
	canStart := true.
	self isReady ifFalse: [ ^self ].
	self isConnected ifFalse: [ ^self ].
	self startThenNotifyObservers 
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> startThenNotifyObservers [ 
	canStart ifFalse: [ ^self ].
	^super startThenNotifyObservers 
]
