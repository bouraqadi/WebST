Class {
	#name : 'WsMvcComponentInitializationTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'viewResetCountExpected',
		'viewInitCountExpected',
		'modelInitCountExpected'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsMvcComponentInitializationTest class >> componentClass [

	^ WsInitializationCounterForTest 
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertComponent [

	self assert: component isConnected.
	self assert: component isStarted.
	self assert: component startCount equals: 1.
	self assert: component readyCount equals: 1.
	component reset.
	self assert: component isConnected.
	self assert: component isStarted.
	self assert: component startCount equals: 1.
	self assert: component readyCount equals: 1.
	
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertViewModelLink [

	^self
]
