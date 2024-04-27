Class {
	#name : #WsCounterComponentTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'counterAsserter'
	],
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsCounterComponentTest class >> componentClass [

	^ WsCounterComponent
]

{ #category : #asserting }
WsCounterComponentTest >> assertViewModelLink [

	counterAsserter assertViewModelLink
]

{ #category : #asserting }
WsCounterComponentTest >> changeModelValues [

	model count: 42
]

{ #category : #accessing }
WsCounterComponentTest >> component: aComponent [

	super component: aComponent.
	counterAsserter := WsCounterComponentTestAsserter component: aComponent 
]
