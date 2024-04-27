Class {
	#name : #WsJsTest,
	#superclass : #WsResourceElementTest,
	#category : #'WebSt-Tests-Views'
}

{ #category : #tests }
WsJsTest >> resourceClass [

	^WsJsScript 
]

{ #category : #tests }
WsJsTest >> testCrossoriginAnonymous [

	resource crossoriginAnonymous.
	self assertHtml: '<script defer type="text/javascript" src="' , url
		, '" crossorigin="anonymous"></script>'
]

{ #category : #tests }
WsJsTest >> testIntegrity [

	| integrity |
	integrity := 'sha384-EVSTQN3/azprG1'.
	resource integrity: integrity.
	self assertHtml:
		'<script defer type="text/javascript" src="' , url , '" integrity="'
		, integrity , '"></script>'
]

{ #category : #tests }
WsJsTest >> testUrlOnly [

	self assertHtml: '<script defer type="text/javascript" src="' , url
		, '"></script>'
]
