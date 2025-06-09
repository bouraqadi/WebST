Class {
	#name : 'WsComponentLifecycleTest',
	#superclass : 'PjWebAppTestCase',
	#instVars : [
		'component',
		'readyCounter',
		'startCounter'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'suite parameters' }
WsComponentLifecycleTest class >> appClass [
	^PjMinimalWebApplication 
]

{ #category : 'tests' }
WsComponentLifecycleTest >> newComponent [
	^self evalBlock: [ WsComponentForLifecycleTest new ].

]

{ #category : 'tests' }
WsComponentLifecycleTest >> setUp [
	super setUp.
	component := self newComponent.
	readyCounter := self evalBlock: [ PjCounter new].
	startCounter := self evalBlock: [ PjCounter new].

]

{ #category : 'tests' }
WsComponentLifecycleTest >> subscribeObservers [
	self evalBlock: [ 
		component onReadyDo: [:readyValue| 
			window at: #readyValue put: readyValue.
			readyCounter increment].
		component onStartedDo: [: startValue |
			window at: #startValue put: startValue.
			startCounter increment]
	].	

]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentAttachedToDomAfterReady [

	self deny: component isReady.
	self deny: component isStarted.
	component setCanBeReady.
	self waitUntil: [ component isReady ].
	document body append: component.
	self assert: component isReady.
	self deny: component isStarted.
	component setCanStart.
	self waitUntil: [ component isStarted ].
	self assert: component isReady.
	self assert: component isStarted.

]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentAttachedToDomBeforeReady [
	self deny: component isReady.
	self deny: component isStarted.
	document body append: component.
	self deny: component isReady.
	self deny: component isStarted.
	component setCanBeReady.
	self waitUntil: [component isReady].
	self deny: component isStarted.
	component setCanStart.
	self waitUntil: [component isStarted].
	self assert: component isReady.

]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentFirstWaitsForSetupThenReady [

	component := self evalBlock: [
		             WsComponentForLifecycleTest newWaitForSetup ].
	component setCanBeReady.
	self assert: component isWaitingForExternalSetup.
	self deny: component isReady.
	component externalSetupDone.
	self waitUntil: [ component isReady ]
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentIsFirstReadyThenStarted [

	component setCanStart.
	self deny: component isReady.
	self deny: component isStarted.
	component setCanBeReady.
	self waitUntil: [component isReady].
	self deny: component isStarted.
	document body append: component.
	self waitUntil: [ component isStarted ].
	self assert: component isReady.

]

{ #category : 'tests' }
WsComponentLifecycleTest >> testObserversSubscribedAfterReady [

	self assert: (window at: #readyValue) isNil.
	self assert: readyCounter count equals: 0.
	self assert: (window at: #startValue) isNil.
	self assert: startCounter count equals: 0.
	component setCanBeReadyAndStart.
	self waitUntil: [ component isReady ].
	self subscribeObservers.
	self assert: (window at: #readyValue) identicalTo: component.
	self assert: readyCounter count equals: 1.
	self assert: (window at: #startValue) isNil.
	self assert: startCounter count equals: 0.
	document body append: component.
	self waitUntil: [ component isStarted ].
	self assert: (window at: #readyValue) identicalTo: component.
	self assert: readyCounter count equals: 1.
	self assert: (window at: #startValue) identicalTo: component.
	self assert: startCounter count equals: 1
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testObserversSubscribedAfterStarted [

	self assert: (window at: #readyValue) isNil.
	self assert: readyCounter count equals: 0.
	self assert: (window at: #startValue) isNil.
	self assert: startCounter count equals: 0.
	component setCanBeReadyAndStart.
	self waitUntil: [ component isReady ].
	document body append: component.
	self waitUntil: [ component isStarted ].
	self subscribeObservers.
	self assert: (window at: #readyValue) identicalTo: component.
	self assert: readyCounter count equals: 1.
	self assert: (window at: #startValue) identicalTo: component.
	self assert: startCounter count equals: 1
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testObserversSubscribedBeforeReady [

	self assert: (window at: #readyValue) isNil.
	self assert: readyCounter count equals: 0.
	self assert: (window at: #startValue) isNil.
	self assert: startCounter count equals: 0.
	self subscribeObservers.
	component setCanBeReadyAndStart.
	self waitUntil: [ component isReady ].
	self assert: (window at: #readyValue) identicalTo: component.
	self assert: readyCounter count equals: 1.
	self assert: (window at: #startValue) isNil.
	self assert: startCounter count equals: 0.
	document body append: component.
	self waitUntil: [ component isStarted ].
	self assert: (window at: #readyValue) identicalTo: component.
	self assert: readyCounter count equals: 1.
	self assert: (window at: #startValue) identicalTo: component.
	self assert: startCounter count equals: 1
]
