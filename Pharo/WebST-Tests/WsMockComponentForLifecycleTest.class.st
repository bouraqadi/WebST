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
		'canBeReadyVariable',
		'didNotifyWaitForExternalSetupObservers',
		'isExternalSetupRequired'
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

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> didNotifyWaitForExternalSetupObservers [

	^ didNotifyWaitForExternalSetupObservers
]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> externalSetupDone [

	lifecycleController externalSetupDone
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> getReady [
	^self
]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> initialize [

	super initialize.
	isConnected := false.
	didNotifyWaitForExternalSetupObservers := false.
	didNotifyIsReadyObservers := false.
	didNotifyIsStartedObservers := false.

]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> isConnected [
	^isConnected
]

{ #category : 'testing' }
WsMockComponentForLifecycleTest >> isExternalSetupRequired [
	^isExternalSetupRequired ifNil: [ false ]
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> isExternalSetupRequired: aBoolean [ 
	isExternalSetupRequired := aBoolean
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

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> notifyWaitForExternalSetupObservers [

	didNotifyWaitForExternalSetupObservers := true
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

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> waitForExternalSetup [
	lifecycleController isExternalSetupRequired: true
]
