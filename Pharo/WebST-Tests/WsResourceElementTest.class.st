Class {
	#name : #WsResourceElementTest,
	#superclass : #TestCase,
	#instVars : [
		'resource',
		'url'
	],
	#category : #'WebST-Tests-Views'
}

{ #category : #testing }
WsResourceElementTest class >> isAbstract [ 
	^self == WsResourceElementTest 
]

{ #category : #tests }
WsResourceElementTest >> assertHtml: expectedHtml [

	| renderer |
	renderer := resource renderClass render: resource.
	renderer flush.
	self assert: renderer html equals: expectedHtml
]

{ #category : #tests }
WsResourceElementTest >> resourceClass [
	self subclassResponsibility 
]

{ #category : #tests }
WsResourceElementTest >> setUp [

	super setUp.
	url := 'https://site.domain/some/path/to/file'.
	resource := self resourceClass url: url
]
