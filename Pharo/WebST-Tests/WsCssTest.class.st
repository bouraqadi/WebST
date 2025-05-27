Class {
	#name : 'WsCssTest',
	#superclass : 'WsResourceElementTest',
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'tests' }
WsCssTest >> resourceClass [

	^WsCssLink 
]

{ #category : 'tests' }
WsCssTest >> testCrossoriginAnonymous [
	"Crossorigin default is anonymous"
	<expectedFailure>
	
	self assertHtmlEquals: '<link rel="stylesheet" href="' , url
		, '" crossorigin="anonymous" referrerpolicy="no-referrer"/>'
]

{ #category : 'tests' }
WsCssTest >> testIntegrity [
	<expectedFailure>

	| integrity |
	integrity := 'sha384-EVSTQN3/azprG1'.
	resource integrity: integrity.
	self assertHtmlEquals:
		'<link rel="stylesheet" href="' , url , '" integrity="' , integrity
		, '" crossorigin="anonymous" referrerpolicy="no-referrer"/>'
]

{ #category : 'tests' }
WsCssTest >> testUrlOnly [

	self assertHtmlMatch: '<link rel="stylesheet" href="' , url , '" */>'
]
