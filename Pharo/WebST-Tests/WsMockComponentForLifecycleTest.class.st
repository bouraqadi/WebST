Class {
	#name : 'WsMockComponentForLifecycleTest',
	#superclass : 'Object',
	#instVars : [
		'connectionBlock',
		'canBeReady',
		'canStart',
		'onReadyAction',
		'onStartedAction',
		'isConnected',
		'didNotifyIsReadyObservers'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> beReady [
	canBeReady ifFalse: [ ^self ].
	onReadyAction value
	
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> connectToDom [
	isConnected := true.
	connectionBlock value
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> didNotifyIsReadyObservers [
	^didNotifyIsReadyObservers
]

{ #category : 'initialization' }
WsMockComponentForLifecycleTest >> initialize [ 
	super initialize.
	canBeReady := false.
	isConnected := false.
	canStart := false
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> isConnected [
	^isConnected
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> onConnectedDo: aFullBlockClosure [ 
	connectionBlock := aFullBlockClosure
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> onReadyDo: aFullBlockClosure [ 
	onReadyAction := aFullBlockClosure
]

{ #category : 'accessing' }
WsMockComponentForLifecycleTest >> onStartedDo: aFullBlockClosure [ 
	onStartedAction := aFullBlockClosure 
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> setCanBeReady [
	canBeReady := true.
	onReadyAction value
]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> setCanStart [
	canStart := true.
	onStartedAction value

]

{ #category : 'acting' }
WsMockComponentForLifecycleTest >> start [
	canStart ifFalse: [ ^self ].
	onStartedAction value
]
