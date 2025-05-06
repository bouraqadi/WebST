Class {
	#name : 'WsDomConnectionNotificationTest',
	#superclass : 'PjWebAppTestCase',
	#instVars : [
		'domElement',
		'jsCounters',
		'counters'
	],
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
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
WsDomConnectionNotificationTest >> assertObservers [

	self waitUntil: [
		counters allSatisfy: [ :aCounter | aCounter count = 1 ] ].
	domElement remove.
	self waitWhile: [ domElement isConnected ].
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self waitUntil: [
		counters allSatisfy: [ :aCounter | aCounter count = 2 ] ]
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> newElement [
	self subclassResponsibility 
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> setUp [
	super setUp.
	domElement := self newElement.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"

]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> subscribeObservers [
	self evalBlock: [ jsCounters do: [: aCounter | domElement onConnectedDo: [aCounter increment]] ].

]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testObserversSubscribedAfterConnection [
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self subscribeObservers.
	self assertObservers 
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testObserversSubscribedBeforeConnection [

	self subscribeObservers.
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self assertObservers
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testObserversSubscribedMultipeTimesReceivesOnly1Notification [
	<expectedFailure>

	self subscribeObservers.
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self subscribeObservers.
	self assertObservers 
]
