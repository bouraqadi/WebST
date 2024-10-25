Class {
	#name : 'WsSingleComponentAppGenerator',
	#superclass : 'Object',
	#instVars : [
		'classFactory',
		'appClassesDict'
	],
	#classInstVars : [
		'current'
	],
	#category : 'WebST-Base-Apps',
	#package : 'WebST-Base',
	#tag : 'Apps'
}

{ #category : 'instance creation' }
WsSingleComponentAppGenerator class >> current [
	^current ifNil: [ current := self new ]
]

{ #category : 'utility' }
WsSingleComponentAppGenerator class >> playgroundFor: aComponent [
	^self current playgroundFor: aComponent
]

{ #category : 'instance creation' }
WsSingleComponentAppGenerator class >> resetCurrent [
	current cleanUp.
	current := nil
]

{ #category : 'creating' }
WsSingleComponentAppGenerator >> appFor: componentClass [

	^ self
		  appFor: componentClass
		  attributes: self defaultDataAttributes
		  style: self defaultStyle
		  cssClasses: self defaultCssClasses
		  appSuperclass: self defaultSuperClass
		  traits: self defaultTraits
]

{ #category : 'creating' }
WsSingleComponentAppGenerator >> appFor: componentClass attributes: componentDataAttributes style: componentStyle cssClasses: componentCssClasses appSuperclass: appSuperclass traits: appTraits [

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
			  newAppFor: componentClass
			  attributes: componentDataAttributes
			  style: componentStyle
			  cssClasses: componentCssClasses
			  appSuperclass: appSuperclass
			  traits: appTraits ]
]

{ #category : 'initialization' }
WsSingleComponentAppGenerator >> cleanUp [

	self resetAppClassesDict.
	self deleteAppClasses
]

{ #category : 'accessing' }
WsSingleComponentAppGenerator >> defaultCssClasses [

	^ nil
]

{ #category : 'accessing' }
WsSingleComponentAppGenerator >> defaultDataAttributes [

	^ #(  )
]

{ #category : 'accessing' }
WsSingleComponentAppGenerator >> defaultStyle [

	^ nil
]

{ #category : 'accessing' }
WsSingleComponentAppGenerator >> defaultSuperClass [
	^WsParametrizableSingleComponentApp 
]

{ #category : 'accessing' }
WsSingleComponentAppGenerator >> defaultTraits [
	^#() 
]

{ #category : 'initialization' }
WsSingleComponentAppGenerator >> deleteAppClasses [

	classFactory cleanUp
]

{ #category : 'initialization' }
WsSingleComponentAppGenerator >> initialize [

	super initialize.
	classFactory := ClassFactoryForTestCase new.
	self resetAppClassesDict
]

{ #category : 'creating' }
WsSingleComponentAppGenerator >> newAppFor: componentClass attributes: componentDataAttributes style: componentStyle cssClasses: componentCssClasses appSuperclass: appSuperclass traits: appTraits [


	| appClass |
	appClass := classFactory newSubclassOf: appSuperclass.
	appClass
		rootComponentClass: componentClass;
		rootComponentAttributes: componentDataAttributes;
		rootComponentStyle: componentStyle;
		rootComponentCssClasses: componentCssClasses.
	^ appClass
]

{ #category : 'utility' }
WsSingleComponentAppGenerator >> playgroundFor: componentClass [
	| app |
	app := self appFor: componentClass .
	app playground
]

{ #category : 'initialization' }
WsSingleComponentAppGenerator >> resetAppClassesDict [

	appClassesDict := Dictionary new
]
