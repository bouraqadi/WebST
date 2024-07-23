Class {
	#name : 'WsCounterComponentTestAsserter',
	#superclass : 'WsComponentTestAsserter',
	#instVars : [
		'display',
		'incrementBtn',
		'decrementBtn',
		'resetBtn'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'asserting' }
WsCounterComponentTestAsserter >> assertCount: expectedCount [

	self assert: display textContent equals: expectedCount asString.
	self assert: model count equals: expectedCount
]

{ #category : 'asserting' }
WsCounterComponentTestAsserter >> assertViewModelLink [

	| expectedCount |
	expectedCount := model count.
	self assertCount: expectedCount.
	3 timesRepeat: [ incrementBtn click ].
	expectedCount := expectedCount + 3.
	self assertCount: expectedCount.
	5 timesRepeat: [ decrementBtn click ].
	expectedCount := expectedCount - 5.
	self assertCount: expectedCount.
	resetBtn click.
	self assertCount: 0
]

{ #category : 'tests' }
WsCounterComponentTestAsserter >> component: aCounterComponent [
 
	super component: aCounterComponent.
	display := domRoot querySelector: '.display'.
	incrementBtn := domRoot querySelector: '.increment'.
	decrementBtn := domRoot querySelector: '.decrement'.
	resetBtn := domRoot querySelector: '.reset'
]
