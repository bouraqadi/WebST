Class {
	#name : 'WsCompositeForLifecycleTest',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'subcomponentB',
		'subcomponentA',
		'subcomponentC'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> getReady [

	super getReady.
	subcomponentA := WsComponentForLifecycleTest new.
	subcomponentB := WsComponentForLifecycleTest new.
	subcomponentC := WsComponentForLifecycleTest new.
	subcomponentA onReadyDo: [ console log: 'Subcomponent A is ready' ].
	subcomponentB onReadyDo: [ console log: 'Subcomponent B is ready' ].
	subcomponentC onReadyDo: [ console log: 'Subcomponent C is ready' ].
	self
		when: subcomponentA
		isReadyDo: [
		console log: 'Composite when: subcomponentA isReadyDo:' ].
	self
		whenAll: {
				subcomponentB.
				subcomponentC }
		areReadyDo: [
			console log:
				'Composite whenAll: {subcomponentB. subcomponentC} areReadyDo:' ].
	view append: subcomponentA.
	view append: subcomponentB.
	view append: subcomponentC.
	console log: 'Composite beReady DONE'
]

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> initialize [

	super initialize.
	self onConnectedDo: [ self writeLog: 'Composite connected' ]
]

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> notifyIsReadyObservers [ 
	super notifyIsReadyObservers.
	console log: 'Composite is ready'
]

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> notifyIsStartedObservers [ 
	super notifyIsStartedObservers.
	console log: 'Composite is started'
]

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> start [

	super start.
	subcomponentA onStartedDo: [
		console log: 'Subcomponent A is started' ].
	subcomponentB onStartedDo: [
		console log: 'Subcomponent B is started' ].
	subcomponentC onStartedDo: [
		console log: 'Subcomponent C is started' ].
	self
		when: subcomponentA
		isStartedDo: [
		console log: 'Composite when: subcomponentA isStartedDo:' ].
	self
		whenAll: {
				subcomponentB.
				subcomponentC }
		areStartedDo: [
			console log:
				'Composite whenAll: {subcomponentB. subcomponentC} areStartedDo:' ].
	console log: 'Composite start DONE'
]

{ #category : 'accessing' }
WsCompositeForLifecycleTest >> subcomponentA [

	^ subcomponentA
]

{ #category : 'accessing' }
WsCompositeForLifecycleTest >> subcomponentB [

	^ subcomponentB
]

{ #category : 'accessing' }
WsCompositeForLifecycleTest >> subcomponentC [

	^ subcomponentC
]
