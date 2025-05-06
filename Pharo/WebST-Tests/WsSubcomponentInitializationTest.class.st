Class {
	#name : 'WsSubcomponentInitializationTest',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTSingleComponentTest',
	#classTraits : 'WsTSingleComponentTest classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsSubcomponentInitializationTest class >> componentClass [
	^WsOuterCompositeForInitTest 
]

{ #category : 'tests' }
WsSubcomponentInitializationTest >> assertRegistriesMatchInitializationSequence [

	| outerComposite middleComposite basicComponent expectedList |
	outerComposite := self component.
	middleComposite := outerComposite middleComposite.
	basicComponent := middleComposite basicComponent.
	expectedList := {
		                basicComponent.
		                middleComposite.
		                outerComposite }.
	self
		assertRegistry: self component readyRegistry
		matchesCollection: expectedList.
	self
		assertRegistry: self component startRegistry
		matchesCollection: expectedList
]

{ #category : 'tests' }
WsSubcomponentInitializationTest >> assertRegistry: registry matchesCollection: expectedList [

	self deny: registry isNil.
	self assert: registry size equals: 3.
	self
		assertCollection: registry asLocalObject
		equals: expectedList
]

{ #category : 'tests' }
WsSubcomponentInitializationTest >> testSubomponentInitializedBeforeComposite [

	self assertRegistriesMatchInitializationSequence.
	self component reset.
	self assertRegistriesMatchInitializationSequence.

]
