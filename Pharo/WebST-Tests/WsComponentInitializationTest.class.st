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
WsComponentInitializationTest >> assertRegistriesMatchCollection: expectedList [

	| localExpectedList |
	localExpectedList := expectedList asLocalObject.
	self
		assertRegistry: self component preConnectRegistry
		matchesCollection:  localExpectedList.
	self
		assertRegistry: self component postConnectRegistry
		matchesCollection: localExpectedList.

]

{ #category : 'tests' }
WsComponentInitializationTest >> assertRegistry: registry matchesCollection: expectedList [

	self deny: registry isNil.
	self assert: registry size equals: 3.
	self
		assertCollection: registry asLocalObject asArray
		equals: expectedList
]

{ #category : 'tests' }
WsComponentInitializationTest >> testSubomponentInitializedBeforeComposite [

	self assertRegistriesMatchCollection: self component withSubcmponentsInInitializationOrder.
	self component resetRegistries.
	self component reset.
	self assertRegistriesMatchCollection: self component withSubcmponentsInInitializationOrder.

]
