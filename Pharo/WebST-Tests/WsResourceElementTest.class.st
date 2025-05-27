Class {
	#name : 'WsResourceElementTest',
	#superclass : 'TestCase',
	#instVars : [
		'resource',
		'url'
	],
	#category : 'WebST-Tests-Resources',
	#package : 'WebST-Tests',
	#tag : 'Resources'
}

{ #category : 'testing' }
WsResourceElementTest class >> isAbstract [ 
	^self == WsResourceElementTest 
]

{ #category : 'tests' }
WsResourceElementTest >> assertHtmlEquals: expectedHtml [

	self assert: self html equals: expectedHtml
]

{ #category : 'tests' }
WsResourceElementTest >> assertHtmlMatch: htmlPattern [

	self assert: (htmlPattern match: self html)
]

{ #category : 'tests' }
WsResourceElementTest >> html [
	| renderer |
	renderer := resource renderClass render: resource.
	renderer flush.
	^renderer html

]

{ #category : 'tests' }
WsResourceElementTest >> resourceClass [
	self subclassResponsibility 
]

{ #category : 'tests' }
WsResourceElementTest >> setUp [

	super setUp.
	url := 'https://site.domain/some/path/to/file'.
	resource := self resourceClass fixedPathString: url
]
