Class {
	#name : 'WsLifecycleControllerTest',
	#superclass : 'TestCase',
	#instVars : [
		'component',
		'controller'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'running' }
WsLifecycleControllerTest >> assertState: expectedCurrentStateSelector [

	| otherStateSelectors |
	self assert: (controller perform: expectedCurrentStateSelector) description: 'Did not reach expected state ', expectedCurrentStateSelector.
	otherStateSelectors := #( isWaitingForExternalSetup
	                          isGettingReady isRunning isStarting
	                          isWaitingForComponent isWaitingForConnectionToDom )
		                       copyWithout: expectedCurrentStateSelector.
	otherStateSelectors do: [ :stateSelector |
		self deny: (controller perform: stateSelector) ]
]

{ #category : 'running' }
WsLifecycleControllerTest >> linkComponentToLifecycleController [

	controller component: component.

]

{ #category : 'running' }
WsLifecycleControllerTest >> setUp [
	super setUp.
	component := WsMockComponentForLifecycleTest new.
	controller := WsLifecycleController new.
	component lifecycleController: controller.

]

{ #category : 'running' }
WsLifecycleControllerTest >> testBeReadyDelayed [

	self linkComponentToLifecycleController.
	self assertState: #isGettingReady.
	self deny: component didNotifyIsReadyObservers.
	component setCanBeReady.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers
]

{ #category : 'running' }
WsLifecycleControllerTest >> testBeReadyImmediatelyAfterComponentSet [

	component setCanBeReady.
	self linkComponentToLifecycleController.
	self assertState: #isWaitingForConnectionToDom.
	self assert: component didNotifyIsReadyObservers
]

{ #category : 'running' }
WsLifecycleControllerTest >> testComponentSet [
	controller component: WsMockComponentForLifecycleTest new.
	self assertState: #isGettingReady.
	self deny: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers

]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnected [

	component setCanBeReady.
	component connectToDom.
	self linkComponentToLifecycleController.
	self assertState: #isStarting.
	self assert: component didNotifyIsReadyObservers.
	self deny: component didNotifyIsStartedObservers
]

{ #category : 'running' }
WsLifecycleControllerTest >> testConnectedDelayed [

	component setCanBeReady.
	self linkComponentToLifecycleController.
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
	self linkComponentToLifecycleController.
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
	self linkComponentToLifecycleController.
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
	self linkComponentToLifecycleController.
	self assertState: #isRunning.
	self assert: component didNotifyIsReadyObservers.
	self assert: component didNotifyIsStartedObservers
]

{ #category : 'running' }
WsLifecycleControllerTest >> testWaitForSetup [

	component waitForExternalSetup.
	self linkComponentToLifecycleController.
	self assertState: #isWaitingForExternalSetup.
	self assert: component didNotifyWaitForExternalSetupObservers.
	component externalSetupDone.
	self assertState: #isGettingReady.

]
