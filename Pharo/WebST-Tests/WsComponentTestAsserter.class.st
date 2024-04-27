Class {
	#name : #WsComponentTestAsserter,
	#superclass : #TestAsserter,
	#instVars : [
		'domRoot',
		'model',
		'component'
	],
	#category : #'WebST-Tests-Support'
}

{ #category : #asserting }
WsComponentTestAsserter class >> assert: aComponent [
	self new
		component: aComponent; assert
]

{ #category : #'instance creation' }
WsComponentTestAsserter class >> component: aComponent [
	^self new component: aComponent; yourself
]

{ #category : #asserting }
WsComponentTestAsserter >> assert [
	self assertViewModelLink 
]

{ #category : #asserting }
WsComponentTestAsserter >> assertViewModelLink [
	self subclassResponsibility 
]

{ #category : #accessing }
WsComponentTestAsserter >> component: aComponent [

	component := aComponent.
	model := aComponent model.
	domRoot := aComponent view
]

{ #category : #accessing }
WsComponentTestAsserter >> resources [

	^ #()
]

{ #category : #running }
WsComponentTestAsserter >> setUp [

	^ self
]

{ #category : #running }
WsComponentTestAsserter >> tearDown [

	^ self
]
