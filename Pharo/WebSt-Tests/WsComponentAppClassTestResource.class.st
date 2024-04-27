Class {
	#name : #WsComponentAppClassTestResource,
	#superclass : #TestResource,
	#instVars : [
		'classFactory',
		'appClassesDict'
	],
	#category : #'WebSt-Tests-Support'
}

{ #category : #creating }
WsComponentAppClassTestResource >> appClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass [

	| descriptor |
	descriptor := self
		              descriptorForSuperclass: appSuperclass
		              traits: appTraits
		              componentClass: componentClass.
	^ appClassesDict at: descriptor ifAbsentPut: [
		  self
			  newAppClassSuperclass: appSuperclass
			  traits: appTraits
			  componentClass: componentClass ]
]

{ #category : #creating }
WsComponentAppClassTestResource >> descriptorForSuperclass: appSuperclass traits: appTraits componentClass: componentClass [

	^WsComponentAppForTestDescriptor new
		 superclass: appSuperclass;
		traits: appTraits;
		componentClass: componentClass 
]

{ #category : #creating }
WsComponentAppClassTestResource >> newAppClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass [

	| appClass |
	appClass := classFactory
		            newSubclassOf: appSuperclass
		            using: appTraits.
	appClass rootComponentClass: componentClass.
	"We need this method to suppress the class side rootComponentClass obtained from the trait defined as #explicitRequirement> It is fullfilled by the WsComponentAppForTest superclass. But, PharoJS does not provide support for #explicitRequirement dynamic lookup."
	appClass compile: 'rootComponentClass ^super rootComponentClass'.
	^ appClass
]

{ #category : #running }
WsComponentAppClassTestResource >> setUp [

	super setUp.
	classFactory := ClassFactoryForTestCase new.
	appClassesDict := Dictionary new
]

{ #category : #running }
WsComponentAppClassTestResource >> tearDown [ 

	super tearDown.
	classFactory cleanUp
]
