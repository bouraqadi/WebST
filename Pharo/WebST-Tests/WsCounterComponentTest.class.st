Class {
	#name : 'WsCounterComponentTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'counterAsserter'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsCounterComponentTest class >> componentClass [

	^ WsCounterComponent
]

{ #category : 'asserting' }
WsCounterComponentTest >> assertViewModelLink [

	counterAsserter assertViewModelLink.
	model count: 42.
	counterAsserter assertViewModelLink.
	
]

{ #category : 'accessing' }
WsCounterComponentTest >> component: aComponent [

	super component: aComponent.
	counterAsserter := WsCounterComponentTestAsserter component: aComponent 
]
