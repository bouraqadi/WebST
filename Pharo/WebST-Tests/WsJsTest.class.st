Class {
	#name : 'WsJsTest',
	#superclass : 'WsResourceElementTest',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'tests' }
WsJsTest >> resourceClass [

	^WsJsScript 
]

{ #category : 'tests' }
WsJsTest >> testCrossoriginAnonymous [

	self assertHtml: '<script defer type="text/javascript" src="' , url
		, '" crossorigin="anonymous" referrerpolicy="no-referrer"></script>'
]

{ #category : 'tests' }
WsJsTest >> testIntegrity [

	| integrity |
	integrity := 'sha384-EVSTQN3/azprG1'.
	resource integrity: integrity.
	self assertHtml:
		'<script defer type="text/javascript" src="' , url , '" integrity="'
		, integrity , '" crossorigin="anonymous" referrerpolicy="no-referrer"></script>'
]

{ #category : 'tests' }
WsJsTest >> testUrlOnly [

	self assertHtml:
		'<script defer type="text/javascript" src="' , url , '" crossorigin="anonymous" referrerpolicy="no-referrer"></script>'
]
