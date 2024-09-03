Class {
	#name : 'WsEventHandlingComponentTest',
	#superclass : 'WsComponentTest',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsEventHandlingComponentTest class >> componentClass [

	^ WsEventTestingComponent
]

{ #category : 'asserting' }
WsEventHandlingComponentTest >> assertComponent [

	self waitUntil: [component isConnectionToDomCaptured] 
]
