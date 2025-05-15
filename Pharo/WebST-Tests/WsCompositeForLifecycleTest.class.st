Class {
	#name : 'WsCompositeForLifecycleTest',
	#superclass : 'WsMinimalComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'subcomponentB',
		'subcomponentA'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> getReady [

	super getReady.
	console log: 'Composite beReady DONE'.

]

{ #category : 'initialization' }
WsCompositeForLifecycleTest >> initialize [

	super initialize.
	subcomponentA := WsComponentForLifecycleTest new.
	subcomponentB := WsComponentForLifecycleTest new.
	self
		when: subcomponentA
		isReadyDo: [ console log: 'Subcomponent A is Ready' ].
	self
		when: subcomponentB
		isReadyDo: [ console log: 'Subcomponent B is Ready' ].
	self
		when: subcomponentA
		isStartedDo: [ console log: 'Subcomponent A is started' ].
	self
		when: subcomponentB
		isStartedDo: [ console log: 'Subcomponent B is started' ].
	view append: subcomponentA.
	view append: subcomponentB.

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
