Class {
	#name : #WsMvcComponentTest,
	#superclass : #WsComponentTest,
	#instVars : [
		'model'
	],
	#category : #'WebSt-Tests-Support'
}

{ #category : #testing }
WsMvcComponentTest class >> isAbstract [

	^ super isAbstract or: [ self == WsMvcComponentTest ]
]

{ #category : #asserting }
WsMvcComponentTest >> assertComponent [

	self assertViewModelLink.
	self changeModelValues.
	self assertViewModelLink.
	self replaceModel.
	self assertViewModelLink.

]

{ #category : #asserting }
WsMvcComponentTest >> assertViewModelLink [

	self subclassResponsibility
]

{ #category : #asserting }
WsMvcComponentTest >> changeModelValues [

	self subclassResponsibility
]

{ #category : #accessing }
WsMvcComponentTest >> component: aComponent [

	super component: aComponent.
	model := aComponent model
]

{ #category : #asserting }
WsMvcComponentTest >> newJsModel [
	"Answers a new model created in JS world"
	^ self jsComponentClass newModel
]

{ #category : #asserting }
WsMvcComponentTest >> replaceModel [
	"Replace the model of the component in JavaScript using the component class in JS"

	"Ensure all test IVs related to component are updated since replacing the model triggers other changes. See WsMvcComponent>>#model:"

	component model: self newJsModel.
	self component: component
]

{ #category : #tests }
WsMvcComponentTest >> testDynamicComponentCreationWithProvidedModel [

	| newComponent staticComponent jsModel |
	jsModel := self newJsModel.
	newComponent := self jsComponentClass model: jsModel.
	staticComponent := self allComponents first.
	"Inserting new component first make it easier to view result during debug"
	document body
		insertBefore: newComponent
		existingChild: staticComponent.
	self assert: self allComponents size equals: 2.
	self assertComponent: newComponent
]
