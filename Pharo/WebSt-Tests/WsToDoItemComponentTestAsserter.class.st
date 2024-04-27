Class {
	#name : #WsToDoItemComponentTestAsserter,
	#superclass : #WsTextComponentTestAsserter,
	#category : #'WebSt-Tests-Examples'
}

{ #category : #asserting }
WsToDoItemComponentTestAsserter >> assertViewModelLink [

	super assertViewModelLink.
	2 timesRepeat: [model isChecked: true.
	self assert: self checkBox checked.
	model isChecked: false.
	self deny: self checkBox checked]
]

{ #category : #asserting }
WsToDoItemComponentTestAsserter >> checkBox [

	^ domRoot querySelector: '.todo-checkbox'
]

{ #category : #asserting }
WsToDoItemComponentTestAsserter >> textDisplay [

	^ component textComponent  readerDisplay
]
