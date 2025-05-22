Class {
	#name : 'WsComponentPlaygroundTest',
	#superclass : 'TestCase',
	#traits : 'PjTWaitUntilReady',
	#classTraits : 'PjTWaitUntilReady classTrait',
	#instVars : [
		'playground'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'tests' }
WsComponentPlaygroundTest >> appClassForComponentClass [

	^WsSingleComponentAppGenerator current appFor: WsMinimalComponent.

]

{ #category : 'tests' }
WsComponentPlaygroundTest >> openPlayground [

	playground := WsMinimalComponent playground.
	self waitUntil: [ playground bridge isConnected ]
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> setUp [
	super setUp.
	WsSingleComponentAppGenerator resetCurrent
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> tearDown [

	playground ifNotNil: [
		playground window close].
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
WsComponentPlaygroundTest >> testObsoleteClass [

	self appClassForComponentClass removeFromSystem.
	self openPlayground
]

{ #category : 'tests' }
WsComponentPlaygroundTest >> testOpenPlayground [

	self openPlayground
]
