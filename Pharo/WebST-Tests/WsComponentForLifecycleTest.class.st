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
	^WsLifecycleControllerForTest 
]

{ #category : 'acting' }
WsComponentForLifecycleTest >> setCanBeReady [
	lifecycleController setCanBeReady
]

{ #category : 'acting' }
WsComponentForLifecycleTest >> setCanBeReadyAndStart [
	lifecycleController setCanBeReadyAndStart
]

{ #category : 'initialization' }
WsComponentForLifecycleTest >> setCanStart [
	lifecycleController setCanStart 
]
