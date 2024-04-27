Class {
	#name : #WsCssTest,
	#superclass : #WsResourceElementTest,
	#category : #'WebST-Tests-Views'
}

{ #category : #tests }
WsCssTest >> resourceClass [

	^WsCssLink 
]

{ #category : #tests }
WsCssTest >> testCrossoriginAnonymous [

	resource crossoriginAnonymous.
	self assertHtml:
		'<link rel="stylesheet" href="' , url
		, '" crossorigin="anonymous"/>'
]

{ #category : #tests }
WsCssTest >> testIntegrity [

	| integrity |
	integrity := 'sha384-EVSTQN3/azprG1'.
	resource integrity: integrity.
	self assertHtml:
		'<link rel="stylesheet" href="' , url , '" integrity="' , integrity
		, '"/>'
]

{ #category : #tests }
WsCssTest >> testUrlOnly [

	self assertHtml: '<link rel="stylesheet" href="' , url , '"/>'
]
