Class {
	#name : 'WsComponentDomConnectionNotificationTest',
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
WsComponentDomConnectionNotificationTest class >> appClass [
	^PjMinimalWebApplication 
]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> assertObservers [
	"counters collect: #count"
	
	self waitUntil: [
		counters allSatisfy: [ :aCounter | aCounter count = 1 ] ].
	domElement remove.
	self waitWhile: [ domElement isConnected ].
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self waitUntil: [
		counters allSatisfy: [ :aCounter | aCounter count = 2 ]]
]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> newElement [
 	^self evalBlock: [ WsMinimalComponent new ].
	
]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> setUp [
	super setUp.
	domElement := self newElement.
	jsCounters := self evalBlock: [ {PjCounter new. PjCounter new} ].
	counters := jsCounters asLocalObject. "Array with proxies to JS counters for easy/faster testing"

]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> subscribeObservers [
	self evalBlock: [ jsCounters do: [: aCounter | domElement onConnectedDo: [aCounter increment]] ].

]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> testObserversSubscribedAfterConnection [

	| extraCounter |
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self subscribeObservers.
	self assertObservers.
	extraCounter := self evalBlock: [ PjCounter new ].
	self assert: extraCounter count equals: 0.
	self evalBlock: [
		domElement onConnectedDo: [ extraCounter increment ] ].
	self waitUntil: [ extraCounter count = 1 ].
	300 milliseconds wait. "Ensure the there is no pending update"
	self assert: extraCounter count equals: 1
]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> testObserversSubscribedBeforeConnection [

	self subscribeObservers.
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self assertObservers
]

{ #category : 'tests' }
WsComponentDomConnectionNotificationTest >> testObserversSubscribedMultipeTimesReceivesOnly1Notification [

	<expectedFailure>
	self subscribeObservers.
	document body prepend: domElement.
	self waitUntil: [ domElement isConnected ].
	self subscribeObservers.
	self assertObservers
]
