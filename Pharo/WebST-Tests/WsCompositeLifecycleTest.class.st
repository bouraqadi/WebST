Class {
	#name : 'WsCompositeLifecycleTest',
	#superclass : 'PjWebAppTestCase',
	#instVars : [
		'composite',
		'subcomponentB',
		'subcomponentA',
		'subcomponentC'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'suite parameters' }
WsCompositeLifecycleTest class >> appClass [ 
	^PjMinimalWebApplication 
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> setUp [

	super setUp.
	composite := self evalBlock: [ WsCompositeForLifecycleTest new ].
	subcomponentA := composite subcomponentA.
	subcomponentB := composite subcomponentB.
	subcomponentC := composite subcomponentC.
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeReadyAfterSubcomponents [

	self deny: composite isReady.
	subcomponentA setCanBeReady.
	self deny: composite isReady.
	subcomponentB setCanBeReady.
	self deny: composite isReady.
	subcomponentC setCanBeReady.
	self waitUntil: [composite isReady].
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeReadyAfterSubcomponentsReversed [

	self deny: composite isReady.
	subcomponentC setCanBeReady.
	self deny: composite isReady.
	subcomponentB setCanBeReady.
	self deny: composite isReady.
	subcomponentA setCanBeReady.
	self waitUntil: [composite isReady].
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderABC [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderACB [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderBAC [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderBCA [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderCAB [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]

{ #category : 'tests' }
WsCompositeLifecycleTest >> testCompositeStartedAfterSubcomponentsOrderCBA [

	document body append: composite.
	self deny: composite isStarted.
	subcomponentC setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentB setCanBeReadyAndStart.
	self deny: composite isStarted.
	subcomponentA setCanBeReadyAndStart.
	self waitUntil: [ composite isStarted ]
]
