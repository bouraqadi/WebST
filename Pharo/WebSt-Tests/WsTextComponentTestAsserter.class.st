Class {
	#name : #WsTextComponentTestAsserter,
	#superclass : #WsComponentTestAsserter,
	#category : #'WebSt-Tests-Library'
}

{ #category : #asserting }
WsTextComponentTestAsserter >> assertViewModelLink [

	| newText |
	self assert: self textDisplay textContent equals: model text.
	newText := 'new text'.
	model text: newText.
	self assert: self textDisplay textContent equals: newText
]

{ #category : #asserting }
WsTextComponentTestAsserter >> textDisplay [
	^component display
]
