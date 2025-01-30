Class {
	#name : 'WsComponentReadyNotificationTest',
	#superclass : 'PjWebAppTestCase',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'suite parameters' }
WsComponentReadyNotificationTest class >> appClass [
	^PjMinimalWebApplication 
]

{ #category : 'tests' }
WsComponentReadyNotificationTest >> newComponent [
	^self evalBlock: [ WsMinimalComponent new ].

]

{ #category : 'tests' }
WsComponentReadyNotificationTest >> testObserversSubscribedAfterConnection [
	| newComponent jsCounters counters |
	newComponent := self newComponent.
	document body prepend: newComponent.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newComponent onComponentReadyDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]

{ #category : 'tests' }
WsComponentReadyNotificationTest >> testObserversSubscribedBeforeConnection [
	| newComponent jsCounters counters |
	newComponent := self newComponent.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newComponent onComponentReadyDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	document body prepend: newComponent.
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]
