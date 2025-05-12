Class {
	#name : 'WsComponentLifecycleController',
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
WsComponentLifecycleController class >> component: aComponent [
	^self new
		component: aComponent;
		yourself
]

{ #category : 'acting' }
WsComponentLifecycleController >> beReady [
	self component beReady.
	self setBeReadyDone.

]

{ #category : 'accessing' }
WsComponentLifecycleController >> component [

	^ component
]

{ #category : 'initialization' }
WsComponentLifecycleController >> component: aComponent [

	component := aComponent.
	component onConnectedDo: [ self setIsConnected ].

]

{ #category : 'initialization' }
WsComponentLifecycleController >> createStates [

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

{ #category : 'initialization' }
WsComponentLifecycleController >> createTransitions [
	nilComponentState transitionTo: gettingReadyState when: [ self isComponentAvailable ].
	gettingReadyState transitionTo: waitingForConnectionState when: [ self isReady "and: [ self isConnected not ]" ].
"	gettingReadyState transitionTo: startingState when: [ self isReady and: [ self isConnected ] ].
"	waitingForConnectionState transitionTo: startingState when: [ self isConnected ].
	startingState transitionTo: runningState when: [ self isStarted ] 
]

{ #category : 'initialization' }
WsComponentLifecycleController >> initialize [

	super initialize.
	isReadyCondition := WsActionTriggeringAndCondition new.
	beReadyDoneKey := isReadyCondition addFalse.
	isConnected := false.
	isStartedCondition := WsActionTriggeringAndCondition new.
	startDoneKey := isStartedCondition addFalse.	
	automaton := SmAutomaton new.
	self createStates.
	self createTransitions
]

{ #category : 'testing' }
WsComponentLifecycleController >> isComponentAvailable [
	^self component notNil
]

{ #category : 'testing' }
WsComponentLifecycleController >> isConnected [
	^isConnected
]

{ #category : 'testing' }
WsComponentLifecycleController >> isReady [
	^ isReadyCondition isTrue
]

{ #category : 'testing' }
WsComponentLifecycleController >> isStarted [
	^isStartedCondition isTrue
]

{ #category : 'acting' }
WsComponentLifecycleController >> setBeReadyDone [
	isReadyCondition setTrue: beReadyDoneKey.
	self step
]

{ #category : 'acting' }
WsComponentLifecycleController >> setIsConnected [
	isConnected := true.
	self step
]

{ #category : 'acting' }
WsComponentLifecycleController >> setStartDone [
	isStartedCondition setTrue: startDoneKey.
	self step
]

{ #category : 'acting' }
WsComponentLifecycleController >> start [
	self component start.
	self setStartDone
	
]

{ #category : 'acting' }
WsComponentLifecycleController >> step [
	automaton step
]
