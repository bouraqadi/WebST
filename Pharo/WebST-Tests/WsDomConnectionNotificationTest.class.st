Class {
	#name : 'WsDomConnectionNotificationTest',
	#superclass : 'PjWebAppTestCase',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'suite parameters' }
WsDomConnectionNotificationTest class >> appClass [
	^PjMinimalWebApplication 
]

{ #category : 'testing' }
WsDomConnectionNotificationTest class >> isAbstract [ 
	^self == WsDomConnectionNotificationTest 
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> newElement [
	self subclassResponsibility 
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testObserversSubscribedAfterConnection [
	| newElement jsCounters counters |
	newElement := self newElement.
	document body prepend: newElement.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newElement onConnectedDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testObserversSubscribedBeforeConnection [
	| newElement jsCounters counters |
	newElement := self newElement.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	self evalBlock: [ jsCounters do: [: aCounter | newElement onConnectedDo: [aCounter increment]] ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"
	document body prepend: newElement.
	self waitWhile: [ counters anySatisfy: [: aCounter | aCounter count = 0]].
	self assert: (counters allSatisfy: [: aCounter | aCounter count = 1])
]
