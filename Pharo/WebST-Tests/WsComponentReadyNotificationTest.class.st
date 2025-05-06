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
WsComponentReadyNotificationTest >> testComponentPassedToNotificationSubscribedAfterReady [
	| newComponent |
	newComponent := self evalBlock: [WsMinimalComponent new].
	document body append: newComponent.
	self waitUntil: [ newComponent isPostConnectInitializeDone ].
	newComponent onStartedDo: [: someValue | window at: #passedValue put: someValue  ].
	self assert: (window at: #passedValue) identicalTo: newComponent 
]

{ #category : 'tests' }
WsComponentReadyNotificationTest >> testComponentPassedToNotificationSubscribedBeforeReady [
	| newComponent |
	newComponent := self evalBlock: [WsMinimalComponent newWhenStartedDo: [: someValue | window at: #passedValue put: someValue ]].
	document body prepend: newComponent.
	self waitUntil: [ newComponent isPostConnectInitializeDone ].
	self assert: (window at: #passedValue) identicalTo: newComponent 
]

{ #category : 'tests' }
WsComponentReadyNotificationTest >> testObserversSubscribedAfterReady [
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
WsComponentReadyNotificationTest >> testObserversSubscribedBeforeReady [
	| newComponent jsCounters counters |
	newComponent := self newComponent.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newComponent onStartedDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	document body prepend: newComponent.
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]
