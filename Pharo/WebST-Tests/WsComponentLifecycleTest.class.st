Class {
	#name : 'WsComponentLifecycleTest',
	#superclass : 'PjWebAppTestCase',
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
	^self evalBlock: [ WsMinimalComponent new ].

]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentIsFirstReadyThenStarted [

	| newComponent registry |
	newComponent := self newComponent.
	self assert: newComponent isReady.
	registry := self evalBlock: [
		            window at: #registry put: OrderedCollection new ].
	self evalBlock: [
		newComponent onStartedDo: [ registry add: #started ].
		newComponent onReadyDo: [ registry add: #ready ] ].
	self deny: newComponent isStarted.
	document body append: newComponent.
	self waitUntil: [ newComponent isStarted ].
	self assert: newComponent isReady.
	self
		assertCollection: registry asLocalObject
		equals: #( ready started )
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentPassedToNotificationSubscribedAfterReady [
	| newComponent |
	newComponent := self evalBlock: [WsMinimalComponent new].
	document body append: newComponent.
	self waitUntil: [ newComponent isStarted ].
	newComponent onStartedDo: [: someValue | window at: #passedValue put: someValue  ].
	self assert: (window at: #passedValue) identicalTo: newComponent 
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testComponentPassedToNotificationSubscribedBeforeReady [
	| newComponent |
	newComponent := self evalBlock: [WsMinimalComponent newWhenStartedDo: [: someValue | window at: #passedValue put: someValue ]].
	document body prepend: newComponent.
	self waitUntil: [ newComponent isStarted ].
	self assert: (window at: #passedValue) identicalTo: newComponent 
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testObserversSubscribedAfterReady [
	| newComponent jsCounters counters |
	newComponent := self newComponent.
	document body prepend: newComponent.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newComponent onStartedDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]

{ #category : 'tests' }
WsComponentLifecycleTest >> testObserversSubscribedBeforeReady [
	| newComponent jsCounters counters |
	newComponent := self newComponent.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newComponent onStartedDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	document body prepend: newComponent.
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]
