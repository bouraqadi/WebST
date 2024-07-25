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

	self assert: component viewResetCount equals: 1.
	self assert: component viewInitCount equals: 1.
	self assert: component modelInitCount equals: 1
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertViewModelLink [

	^self
]
