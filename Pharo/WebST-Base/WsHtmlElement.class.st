Class {
	#name : 'WsHtmlElement',
	#superclass : 'Object',
	#category : 'WebST-Base-Components',
	#package : 'WebST-Base',
	#tag : 'Components'
}

{ #category : 'pharoJs support' }
WsHtmlElement class >> javascriptName [

	<pharoJsSkip>
	^ #HTMLElement
]

{ #category : 'accessing' }
WsHtmlElement >> dataAttributeAt: jsAttributeName ifAbsent: aBlock [

	"Read attributes defined in html. JS attribute name is camel case.
	https://developer.mozilla.org/en-US/docs/Web/API/HTMLElement/dataset"
	^ self dataset at: jsAttributeName ifAbsent: aBlock
]
