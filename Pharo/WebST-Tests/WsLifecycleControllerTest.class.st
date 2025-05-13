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
	self deny: component didNotifyIsReadyObservers.
	component setCanBeReady.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testBeReadyImmediatelyAfterComponentSet [
	component setCanBeReady.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testComponentSet [
	lifecycle component: WsMockComponentForLifecycleTest new.
	self assertState: #isGettingReady.
	self deny: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnected [
	component setCanBeReady.
	component connectToDom.
	lifecycle component: component.
	self assertState: #isStarting.
	self assert: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnectedDelayed [
	component setCanBeReady.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers.
	component connectToDom.
	self assertState: #isStarting.
	self assert: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testNoComponent [
	self assertState: #isWaitingForComponent.
	self deny: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartAfterDelayedConnection [
	component setCanBeReady.
	component setCanStart.
	lifecycle component: component.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers.
	component connectToDom.
	self assertState: #isRunning.
	self assert: component didNotifyIsReadyObservers.
	self assert: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartDoneAfterDelayedStart [
	component setCanBeReady.
	component connectToDom.
	lifecycle component: component.
	self assertState: #isStarting.
	self assert: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers.
	component setCanStart.
	self assertState: #isRunning.
	self assert: component didNotifyIsReadyObservers.
	self assert: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testStartImmediatelyIfAlreadyConnected [
	component setCanBeReady.
	component connectToDom.
	component setCanStart.
	lifecycle component: component.
	self assertState: #isRunning.
	self assert: component didNotifyIsReadyObservers.
	self assert: component didNotifyIsStartedObservers

]
