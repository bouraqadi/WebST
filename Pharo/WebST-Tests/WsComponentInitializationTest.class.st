Class {
	#name : 'WsComponentInitializationTest',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTSingleComponentTest',
	#classTraits : 'WsTSingleComponentTest classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsComponentInitializationTest class >> componentClass [
	^WsLevel3InitTestComponent 
]

{ #category : 'tests' }
WsComponentInitializationTest >> assertRegistriesMatchInitializationSequence [

	| level3Component level2Component level1Component expectedList |
	level3Component := self component.
	level2Component := level3Component level2Subcomponent.
	level1Component := level2Component level1Subcomponent.
	expectedList := {
		                level1Component.
		                level2Component.
		                level3Component }.
	self
		assertRegistry: self component readyRegistry
		matchesCollection: expectedList.
	self
		assertRegistry: self component startRegistry
		matchesCollection: expectedList
]

{ #category : 'tests' }
WsComponentInitializationTest >> assertRegistry: registry matchesCollection: expectedList [

	self deny: registry isNil.
	self assert: registry size equals: 3.
	self
		assertCollection: registry asLocalObject
		equals: expectedList
]

{ #category : 'tests' }
WsComponentInitializationTest >> testSubomponentInitializedBeforeComposite [

	self assertRegistriesMatchInitializationSequence.
	self component reset.
	self assertRegistriesMatchInitializationSequence.

]
