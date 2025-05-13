Class {
	#name : 'WsLifecycleControllerTest',
	#superclass : 'TestCase',
	#instVars : [
		'lifecycle',
		'component'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'running' }
WsLifecycleControllerTest >> assertState: expectedCurrentStateSelector [
	| otherStateSelectors |
	self assert: (lifecycle perform: expectedCurrentStateSelector ).
	otherStateSelectors :=	#(isGettingReady isRunning isStarting isWaitingForComponent isWaitingForConnectionToDom ) copyWithout: expectedCurrentStateSelector.
	otherStateSelectors do: [ : stateSelector |
		self deny: (lifecycle perform: stateSelector) ]
]

{ #category : 'running' }
WsLifecycleControllerTest >> setUp [
	super setUp.
	lifecycle := WsLifecycleController new.
	component := WsMockComponentForLifecycleTest new
]

{ #category : 'running' }
WsLifecycleControllerTest >> testBeReadyDelayed [
	lifecycle component: component.
	self assertState: #isGettingReady.
	component setCanBeReady.
	self assertState: #isWaitingForConnectionToDom.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testBeReadyImmediatelyAfterComponentSet [
	component setCanBeReady.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testComponentSet [
	lifecycle component: WsMockComponentForLifecycleTest new.
	self assertState: #isGettingReady 
]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnected [
	component setCanBeReady.
	component connectToDom.
	lifecycle component: component.
	self assertState: #isStarting.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnectedDelayed [
	component setCanBeReady.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.
	component connectToDom.
	self assertState: #isStarting.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testNoComponent [
	self assertState: #isWaitingForComponent.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartAfterDelayedConnection [
	component setCanBeReady.
	component setCanStart.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.
	component connectToDom.
	self assertState: #isRunning.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartDoneAfterDelayedStart [
	component setCanBeReady.
	component connectToDom.
	lifecycle component: component.
	self assertState: #isStarting.
	component setCanStart.
	self assertState: #isRunning.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartImmediatelyIfAlreadyConnected [
	component setCanBeReady.
	component connectToDom.
	component setCanStart.
	lifecycle component: component.
	self assertState: #isRunning.
]
