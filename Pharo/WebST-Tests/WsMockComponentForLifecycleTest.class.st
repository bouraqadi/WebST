Class {
	#name : 'WsMockComponentForLifecycleTest',
	#superclass : 'Object',
	#instVars : [
		'connectionBlock',
		'isConnected',
		'didNotifyIsReadyObservers',
		'didNotifyIsStartedObservers',
		'lifecycleController',
		'canStartVariable',
		'canBeReadyVariable'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> connectToDom [
	isConnected := true.
	connectionBlock value
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> didNotifyIsReadyObservers [
	^didNotifyIsReadyObservers
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> didNotifyIsStartedObservers [
	^didNotifyIsStartedObservers
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> getReady [
	^self
]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> initialize [ 
	super initialize.
	isConnected := false.
	didNotifyIsReadyObservers := false.
	didNotifyIsStartedObservers := false
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> isConnected [
	^isConnected
]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> lifecycleController: aController [
	lifecycleController := aController.
	canBeReadyVariable := lifecycleController addIsReadyVariable.
	canStartVariable := lifecycleController addIsStartedVariable
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> notifyIsReadyObservers [
	didNotifyIsReadyObservers := true.

]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> notifyIsStartedObservers [
	didNotifyIsStartedObservers := true 
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> onConnectedDo: aFullBlockClosure [ 
	connectionBlock := aFullBlockClosure
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> setCanBeReady [
	canBeReadyVariable setTrue
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> setCanStart [
	canStartVariable setTrue
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> start [
	^self
]
