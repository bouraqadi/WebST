Class {
	#name : 'WsComponentTest',
	#superclass : 'PjWebAppTestCase',
	#traits : 'WsTUrlTest + WsTSingleComponentTest',
	#classTraits : 'WsTUrlTest classTrait + WsTSingleComponentTest classTrait',
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'accessing' }
WsComponentTest class >> componentClass [
	^self subclassResponsibility 
]

{ #category : 'testing' }
WsComponentTest class >> isAbstract [

	^ self == WsComponentTest
]

{ #category : 'accessing' }
WsComponentTest class >> resources [

	^ super resources , { self appClassGeneratorClass }
]

{ #category : 'asserting' }
WsComponentTest >> assertComponent [

	^self 
]

{ #category : 'asserting' }
WsComponentTest >> assertComponent: aComponent [

	self assertComponent: aComponent with: nil
]

{ #category : 'asserting' }
WsComponentTest >> assertComponent: aComponent with: aBlock [

	self waitUntil: [ aComponent isStarted ].
	self component: aComponent.
	self assertComponentClass.
	aBlock value.
	self assertComponent
]

{ #category : 'asserting' }
WsComponentTest >> assertComponentClass [

	| actualClass expectedClass |
	expectedClass := self bridge jsGlobalAt: self componentClass name.
	actualClass := self evalBlock: [ component class ].
	self assert: actualClass identicalTo: expectedClass
]

{ #category : 'asserting' }
WsComponentTest >> assertCustomAttributesApplied [

	^self 
]

{ #category : 'asserting' }
WsComponentTest >> assertDefaultAttributesApplied [

	^ self
]

{ #category : 'accessing' }
WsComponentTest >> jsComponentClass [

	^ self bridge jsGlobalAt: self componentClass name
]

{ #category : 'tests' }
WsComponentTest >> testDynamicComponentCreationBasic [

	| newComponent |
	newComponent := self jsComponentClass new.
	"Inserting new component first make it easier to view result during debug"
	document body prepend: newComponent.
	self assert: self allComponents size equals: 2.
	self
		assertComponent: newComponent
		with: [ self assertDefaultAttributesApplied ]
]

{ #category : 'tests' }
WsComponentTest >> testStaticComponentCreation [
	"Component is defined using HTML tags. See WsTComponentApp >> #newPage."

	| allComponents |
	allComponents := self allComponents.
	self assert: allComponents size equals: 1.
	self
		assertComponent: self firstComponent
		with: [ self assertCustomAttributesApplied ]
]
