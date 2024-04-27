Class {
	#name : #WsTextComponentTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'asserter'
	],
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsTextComponentTest class >> componentClass [

	^ WsTextComponent 
]

{ #category : #asserting }
WsTextComponentTest >> assertViewModelLink [

	asserter assertViewModelLink 
]

{ #category : #asserting }
WsTextComponentTest >> changeModelValues [

	model text: 'another random text to test model change'
]

{ #category : #accessing }
WsTextComponentTest >> component: aTextComponent [
	super component: aTextComponent.
	asserter := WsTextComponentTestAsserter component: aTextComponent 
]
