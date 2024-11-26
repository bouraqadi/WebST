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
	self assertHtml:
		'<link rel="stylesheet" href="' , url
		, '" crossorigin="anonymous" referrerpolicy="no-referrer"/>'
]

{ #category : 'tests' }
WsCssTest >> testIntegrity [

	| integrity |
	integrity := 'sha384-EVSTQN3/azprG1'.
	resource integrity: integrity.
	self assertHtml:
		'<link rel="stylesheet" href="' , url , '" integrity="' , integrity
		, '" crossorigin="anonymous" referrerpolicy="no-referrer"/>'
]

{ #category : 'tests' }
WsCssTest >> testUrlOnly [

	self assertHtml: '<link rel="stylesheet" href="' , url , '" crossorigin="anonymous" referrerpolicy="no-referrer"/>'
]
