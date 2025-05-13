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
		'beReadyDoneVariable',
		'startDoneVariable'
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

{ #category : 'variables' }
WsLifecycleController >> addIsReadyVariable [
	^isReadyCondition addFalse 
]

{ #category : 'variables' }
WsLifecycleController >> addIsStartedVariable [
	^isStartedCondition addFalse 
]

{ #category : 'acting' }
WsLifecycleController >> beReady [
	self component beReady.
	self setBeReadyDone 
]

{ #category : 'accessing' }
WsLifecycleController >> component [

	^ component
]

{ #category : 'initialization' }
WsLifecycleController >> component: aComponent [

	"We immediately make the automaton step so we exit the state where the component is nil 
	and enter the state for making it get ready. 
	See #createStates method"
	
	component := aComponent.
	component onConnectedDo: [ self setIsConnected ].
	self step

]

{ #category : 'states' }
WsLifecycleController >> createStates [

	nilComponentState := automaton newState.
	nilComponentState label: 'Nil Component'.
	automaton initialState: nilComponentState.
	gettingReadyState := automaton newStateOnEntryDo: [ self beReady ] onExitDo: [self notifyIsReadyObservers].
	gettingReadyState label: 'Getting Ready'.
	waitingForConnectionState := automaton newState.
	waitingForConnectionState label: 'Waiting for Connection to DOM'.
	startingState := automaton newStateOnEntryDo: [ self start ] onExitDo: [self notifyIsStartedObservers].
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
	automaton := SmAutomaton new.
	self createStates.
	self createTransitions.
	isReadyCondition := WsActionTriggeringAndCondition whenTrueDo: [self step].
	beReadyDoneVariable := isReadyCondition addFalse.
	isStartedCondition := WsActionTriggeringAndCondition whenTrueDo: [self step].
	startDoneVariable := isStartedCondition addFalse.	

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
WsLifecycleController >> notifyIsReadyObservers [
	component notifyIsReadyObservers
]

{ #category : 'acting' }
WsLifecycleController >> notifyIsStartedObservers [
	component notifyIsStartedObservers
]

{ #category : 'acting' }
WsLifecycleController >> setBeReadyDone [
	beReadyDoneVariable setTrue
]

{ #category : 'acting' }
WsLifecycleController >> setIsConnected [
	self step
]

{ #category : 'acting' }
WsLifecycleController >> setStartDone [
	startDoneVariable setTrue
]

{ #category : 'acting' }
WsLifecycleController >> start [
	self component start.
	self setStartDone 
]

{ #category : 'acting' }
WsLifecycleController >> step [
	automaton step
]
