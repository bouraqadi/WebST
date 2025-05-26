Class {
	#name : 'WsComponentPlaygroundTest',
	#superclass : 'TestCase',
	#traits : 'PjTWaitUntilReady',
	#classTraits : 'PjTWaitUntilReady classTrait',
	#instVars : [
		'playground',
		'appClass'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsComponentPlaygroundTest >> appClassForComponentClass [

	^ WsSingleComponentAppGenerator current appFor: self componentClass
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> closePlayground [

	playground ifNotNil: [ playground window close ].

]

{ #category : 'tests' }
WsComponentPlaygroundTest >> componentClass [

	^WsMinimalComponent
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> openPlayground [

	playground := self componentClass playground.
	self waitUntil: [ playground bridge isConnected ]
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> setUp [
	super setUp.
	WsSingleComponentAppGenerator resetCurrent.
	appClass := self appClassForComponentClass 
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> tearDown [

	self closePlayground.
	super tearDown
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testAppClassCached [

	| classA classB |
	classA := self appClassForComponentClass.
	classB := self appClassForComponentClass.
	self assert: classB identicalTo: classA
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testAppClassRemovedUponClosingPlayground [

	self openPlayground.
	self closePlayground.
	self deny: (Smalltalk globals includes: appClass)
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testAppExport [

	appClass exportApp.
	self assert: appClass appFullHtmlFileName asFileReference exists
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testAppFolder [

	appClass resetAppFolder.
	self assert: appClass appFolder exists.
	self
		assert: appClass appFolder basename
		equals: self componentClass name , '-Test'
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testObsoleteClass [

	appClass removeFromSystem.
	self openPlayground
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testOpenPlayground [

	self openPlayground.
	self assert: (playground window title includesSubstring: self componentClass name)
]
