Class {
	#name : 'WsComponentAppClassTestResource',
	#superclass : 'TestResource',
	#instVars : [
		'appGenerator'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'creating' }
WsComponentAppClassTestResource >> appFor: componentClass attributes: componentDataAttributes style: componentStyle cssClasses: componentCssClasses appSuperclass: appSuperclass traits: appTraits [

	^ appGenerator
		  appFor: componentClass
		  attributes: componentDataAttributes
		  style: componentStyle
		  cssClasses: componentCssClasses
		  appSuperclass: appSuperclass
		  traits: appTraits
]

{ #category : 'running' }
WsComponentAppClassTestResource >> setUp [

	super setUp.
	appGenerator := WsSingleComponentAppGenerator new.

]

{ #category : 'running' }
WsComponentAppClassTestResource >> tearDown [ 

	super tearDown.
	appGenerator cleanUp
]
