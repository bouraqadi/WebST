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
WsComponentAppClassTestResource >> appClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass attributes: componentDataAttributes style: componentStyle cssClasses: componentCssClasses [

	| descriptor |
	descriptor := WsComponentAppForTestDescriptor new
		  superclass: appSuperclass;
		  traits: appTraits;
		  componentClass: componentClass;
		  attributes: componentDataAttributes;
		  style: componentStyle;
		  cssClasses: componentCssClasses;
		  yourself.
	^ appClassesDict at: descriptor ifAbsentPut: [
		  self
			  newAppClassSuperclass: appSuperclass
			  traits: appTraits
			  componentClass: componentClass
			  attributes: componentDataAttributes
			  style: componentStyle
		  	  cssClasses: componentCssClasses ]
]

{ #category : 'creating' }
WsComponentAppClassTestResource >> newAppClassSuperclass: appSuperclass traits: appTraits componentClass: componentClass attributes: componentDataAttributes style: componentStyle cssClasses: componentCssClasses [


	| appClass |
	appClass := classFactory newSubclassOf: appSuperclass.
	appClass
		rootComponentClass: componentClass;
		rootComponentAttributes: componentDataAttributes;
		rootComponentStyle: componentStyle;
		rootComponentCssClasses: componentCssClasses.
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
