Class {
	#name : 'WsComponentLifecycleControllerForTest',
	#superclass : 'WsComponentLifecycleController',
	#instVars : [
		'canBeReadyKey',
		'canStartKey'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsComponentLifecycleControllerForTest >> initialize [

	super initialize.
	canBeReadyKey := isReadyCondition addFalse.
	canStartKey := isStartedCondition addFalse.	

]

{ #category : 'acting' }
WsComponentLifecycleControllerForTest >> setCanBeReady [ 
	isReadyCondition setTrue: canBeReadyKey.
	self step
]

{ #category : 'acting' }
WsComponentLifecycleControllerForTest >> setCanStart [ 
	isStartedCondition setTrue: canStartKey .
	self step
]
