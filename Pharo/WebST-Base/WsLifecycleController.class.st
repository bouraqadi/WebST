Class {
	#name : 'WsLifecycleController',
	#superclass : 'Object',
	#instVars : [
		'component',
		'automaton',
		'runningState',
		'startingState',
		'gettingReadyState',
		'waitingForConnectionState',
		'nilComponentState',
		'isReadyCondition',
		'isStartedCondition',
		'beReadyDoneKey',
		'startDoneKey',
		'isConnected'
	],
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'instance creation' }
WsLifecycleController class >> component: aComponent [
	^self new
		component: aComponent;
		yourself
]

{ #category : 'acting' }
WsLifecycleController >> beReady [
	self component beReady.

]

{ #category : 'accessing' }
WsLifecycleController >> component [

	^ component
]

{ #category : 'initialization' }
WsLifecycleController >> component: aComponent [

	component := aComponent.
	component onReadyDo: [ self setBeReadyDone ].
	component onConnectedDo: [ self setIsConnected ].
	component onStartedDo: [ self setStartDone ].
	self step

]

{ #category : 'states' }
WsLifecycleController >> createStates [

	nilComponentState := automaton newState.
	nilComponentState label: 'Nil Component'.
	automaton initialState: nilComponentState.
	gettingReadyState := automaton newStateOnEntryDo: [ self beReady ].
	gettingReadyState label: 'Getting Ready'.
	waitingForConnectionState := automaton newState.
	waitingForConnectionState label: 'Waiting for Connection to DOM'.
	startingState := automaton newStateOnEntryDo: [ self start ].
	startingState label: 'Starting'.
	runningState := automaton newState.
	runningState label: 'Running'
]

{ #category : 'transitions' }
WsLifecycleController >> createTransitions [
	nilComponentState transitionTo: gettingReadyState when: [ self isComponentAvailable ].
	gettingReadyState transitionTo: waitingForConnectionState when: [ self isReady and: [ self isConnected not ] ].
	gettingReadyState transitionTo: startingState when: [ self isReady and: [ self isConnected ] ].
	waitingForConnectionState transitionTo: startingState when: [ self isConnected ].
	startingState transitionTo: runningState when: [ self isStarted ] 
]

{ #category : 'initialization' }
WsLifecycleController >> initialize [

	super initialize.
	isReadyCondition := WsActionTriggeringAndCondition new.
	beReadyDoneKey := isReadyCondition addFalse.
	isStartedCondition := WsActionTriggeringAndCondition new.
	startDoneKey := isStartedCondition addFalse.	
	automaton := SmAutomaton new.
	self createStates.
	self createTransitions
]

{ #category : 'transitions' }
WsLifecycleController >> isComponentAvailable [
	^self component notNil
]

{ #category : 'transitions' }
WsLifecycleController >> isConnected [
	component ifNil: [ ^false ].
	^component isConnected
]

{ #category : 'states' }
WsLifecycleController >> isGettingReady [
	^automaton currentState == gettingReadyState 
]

{ #category : 'transitions' }
WsLifecycleController >> isReady [
	^ isReadyCondition isTrue
]

{ #category : 'states' }
WsLifecycleController >> isRunning [
	^automaton currentState == runningState 
]

{ #category : 'transitions' }
WsLifecycleController >> isStarted [
	^isStartedCondition isTrue
]

{ #category : 'states' }
WsLifecycleController >> isStarting [
	^automaton currentState == startingState 
]

{ #category : 'states' }
WsLifecycleController >> isWaitingForComponent [
	^automaton currentState == nilComponentState 
]

{ #category : 'states' }
WsLifecycleController >> isWaitingForConnectionToDom [
	^automaton currentState == waitingForConnectionState 
]

{ #category : 'acting' }
WsLifecycleController >> setBeReadyDone [
	isReadyCondition setTrue: beReadyDoneKey.
	self step
]

{ #category : 'acting' }
WsLifecycleController >> setIsConnected [
	self step
]

{ #category : 'acting' }
WsLifecycleController >> setStartDone [
	isStartedCondition setTrue: startDoneKey.
	self step
]

{ #category : 'acting' }
WsLifecycleController >> start [
	self component start.

]

{ #category : 'acting' }
WsLifecycleController >> step [
	automaton step
]
