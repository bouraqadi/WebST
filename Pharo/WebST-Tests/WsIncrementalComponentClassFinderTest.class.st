Class {
	#name : 'WsIncrementalComponentClassFinderTest',
	#superclass : 'TestCase',
	#instVars : [
		'finder'
	],
	#category : 'WebST-Tests-Support',
	#package : 'WebST-Tests',
	#tag : 'Support'
}

{ #category : 'asserting' }
WsIncrementalComponentClassFinderTest >> assertAnalyzing: aClass foundComponentClasses: expectedComponentClasses [
	| actualComponents |
	actualComponents := finder allNewComponentClassesFrom: aClass.
	self assertCollection: actualComponents hasSameElements: expectedComponentClasses 
]

{ #category : 'running' }
WsIncrementalComponentClassFinderTest >> setUp [
	super setUp.
	finder := WsIncrementalComponentClassFinder new
]

{ #category : 'asserting' }
WsIncrementalComponentClassFinderTest >> testFindComponentClassOnlyOnce [

	self assertAnalyzing: WsMinimalComponent foundComponentClasses: {WsMinimalComponent}.
	self assertAnalyzing: WsMinimalComponent foundComponentClasses: #().
	self assertAnalyzing: WsCounterComponent foundComponentClasses: {WsCounterComponent}.
	self assertAnalyzing: WsCounterComponent foundComponentClasses: #().

]
