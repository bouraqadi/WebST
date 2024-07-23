Class {
	#name : 'WsTextComponentTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'asserter'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsTextComponentTest class >> componentClass [

	^ WsTextComponent 
]

{ #category : 'accessing' }
WsTextComponentTest class >> dataAttributes [
	^{#text -> 'Text for custom attribute'}
]

{ #category : 'asserting' }
WsTextComponentTest >> assertCustomAttributesApplied [

	super assertCustomAttributesApplied.
	self
		assert: component text
		equals: (self dataAttributesDict at: #text)
]

{ #category : 'asserting' }
WsTextComponentTest >> assertDefaultAttributesApplied [

	super assertDefaultAttributesApplied.
	self
		assert: component text
		equals: self rootComponentClass defaultTextAttribute
]

{ #category : 'asserting' }
WsTextComponentTest >> assertViewModelLink [

	asserter assertViewModelLink 
]

{ #category : 'accessing' }
WsTextComponentTest >> component: aTextComponent [
	super component: aTextComponent.
	asserter := WsTextComponentTestAsserter component: aTextComponent 
]
