Class {
	#name : 'WsComponentAppClassTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'classFactory',
		'appClassesDict'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'creating' }
WsComponentAppClassTestResource >> appClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass attributes: attributes [

	| descriptor |
	descriptor := self
		              descriptorForSuperclass: appSuperclass
		              traits: appTraits
		              componentClass: componentClass
		              attributes: attributes.
	^ appClassesDict at: descriptor ifAbsentPut: [
		  self
			  newAppClassSuperclass: appSuperclass
			  traits: appTraits
			  componentClass: componentClass
			  attributes: attributes ]
]

{ #category : 'creating' }
WsComponentAppClassTestResource >> descriptorForSuperclass: appSuperclass traits: appTraits componentClass: componentClass attributes: attributes [

	^ WsComponentAppForTestDescriptor new
		  superclass: appSuperclass;
		  traits: appTraits;
		  componentClass: componentClass;
		attributes: attributes;
		yourself
]

{ #category : 'creating' }
WsComponentAppClassTestResource >> newAppClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass attributes: attributes [

	| appClass |
	appClass := classFactory
		            newSubclassOf: appSuperclass.
	appClass
		rootComponentClass: componentClass;
		rootComponentAttributes: attributes.
	^ appClass
]

{ #category : 'running' }
WsComponentAppClassTestResource >> setUp [

	super setUp.
	classFactory := ClassFactoryForTestCase new.
	appClassesDict := Dictionary new
]

{ #category : 'running' }
WsComponentAppClassTestResource >> tearDown [ 

	super tearDown.
	classFactory cleanUp
]
