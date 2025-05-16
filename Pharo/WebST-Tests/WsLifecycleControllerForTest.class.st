Class {
	#name : 'WsLifecycleControllerForTest',
	#superclass : 'WsLifecycleController',
	#instVars : [
		'canStartVariabe',
		'canBeReadyVariabe'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsLifecycleControllerForTest >> initialize [ 
	super initialize.
	canBeReadyVariabe := isReadyCondition addFalseVariable.
	canStartVariabe := isStartedCondition addFalseVariable.
]

{ #category : 'acting' }
WsLifecycleControllerForTest >> setCanBeReady [
	canBeReadyVariabe setTrue
]

{ #category : 'acting' }
WsLifecycleControllerForTest >> setCanBeReadyAndStart [
	self
		setCanBeReady; 
		setCanStart
	
]

{ #category : 'acting' }
WsLifecycleControllerForTest >> setCanStart [
	canStartVariabe setTrue
]
