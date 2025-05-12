Class {
	#name : 'WsComponentForLifecycleTest',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsComponentForLifecycleTest >> lifeCycleControllerClass [ 
	^WsComponentLifecycleControllerForTest 
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanBeReady [
	lifecycleController setCanBeReady 
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanBeReadyAndStart [
	self 
		setCanBeReady; 
		setCanStart
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanStart [
	lifecycleController setCanStart 
]
