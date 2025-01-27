Class {
	#name : 'WsSubcomponentsInitializationOrderTest',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTSingleComponentTest',
	#classTraits : 'WsTSingleComponentTest classTrait',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'accessing' }
WsSubcomponentsInitializationOrderTest class >> componentClass [
	^WsLevel3InitTestComponent 
]

{ #category : 'tests' }
WsSubcomponentsInitializationOrderTest >> testCreationOrder [
	| registry level3Component level2Component level1Component expectedList |
	registry := self component initRegistry.
	self deny: registry isNil.
	self assert: registry size equals: 3.
	level3Component := self component.
	level2Component := level3Component level2Subcomponent.
	level1Component := level2Component level1Subcomponent.
	expectedList := { level1Component. level2Component. level3Component }.
	self assertCollection: registry asLocalObject asArray equals: expectedList
]
