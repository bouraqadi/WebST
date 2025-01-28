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

{ #category : 'tests' }
WsDomConnectionNotificationTest >> setUp [
	super setUp.
	"Ensure Node extension for supporting DOM connection notifications"
	self bridge loadClass: WsNode.
	
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testComponentObserverSubscribedAfterConnection [
	| newComponent counter |
	counter := self evalBlock: [ PjCounter new ].
	newComponent := self evalBlock: [ WsMinimalComponent new ].
	document body prepend: newComponent.
	self evalBlock: [ newComponent onConnectedDo: [ counter increment ] ].
	self waitWhile: [ counter count = 0].
	self assert: counter count equals: 1
	
]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testComponentObserverSubscribedBeforeConnection [
	| newComponent counter |
	counter := self evalBlock: [ PjCounter new ].
	newComponent := self evalBlock: [ WsMinimalComponent new ].
	self evalBlock: [ newComponent onConnectedDo: [ counter increment ] ].
	self assert: counter count equals: 0.
	document body prepend: newComponent.
	self waitWhile: [ counter count = 0].
	self assert: counter count equals: 1

]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testDivObserverSubscribedAfterConnection [
	| newDiv counter |
	counter := self evalBlock: [ PjCounter new ].
	newDiv := document createElement: #div.
	document body prepend: newDiv.
	self evalBlock: [ newDiv onConnectedDo: [counter increment] ].
	self waitWhile: [ counter count = 0].
	self assert: counter count equals: 1

]

{ #category : 'tests' }
WsDomConnectionNotificationTest >> testDivObserverSubscribedBeforeConnection [
	| newDiv counter |
	counter := self evalBlock: [ PjCounter new ].
	newDiv := document createElement: #div.
	self evalBlock: [ newDiv onConnectedDo: [ counter increment ] ].
	self assert: counter count equals: 0.
	document body prepend: newDiv.
	self waitWhile: [ counter count = 0].
	self assert: counter count equals: 1.
	
]
