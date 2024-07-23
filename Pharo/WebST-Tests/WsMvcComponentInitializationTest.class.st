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

	self assert: component viewResetCount equals: viewResetCountExpected.
	self assert: component viewInitCount equals: viewInitCountExpected.
	self assert: component modelInitCount equals: modelInitCountExpected.
	
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> assertViewModelLink [

	^self
]

{ #category : 'asserting' }
WsMvcComponentInitializationTest >> changeModelValues [

	^self
]

{ #category : 'tests' }
WsMvcComponentInitializationTest >> testDynamicComponentCreationBasic [

	viewResetCountExpected := 1.
	viewInitCountExpected := 1.
	modelInitCountExpected := 1.
	super testDynamicComponentCreationBasic
]

{ #category : 'tests' }
WsMvcComponentInitializationTest >> testDynamicComponentCreationWithProvidedModel [

	viewResetCountExpected := 2.
	viewInitCountExpected := 2.
	modelInitCountExpected := 2.
	super testDynamicComponentCreationWithProvidedModel
]

{ #category : 'tests' }
WsMvcComponentInitializationTest >> testStaticComponentCreation [
	viewResetCountExpected := 1.
	viewInitCountExpected := 1.
	modelInitCountExpected := 1.
	super testStaticComponentCreation
]
