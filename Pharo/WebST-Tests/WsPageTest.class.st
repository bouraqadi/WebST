Class {
	#name : 'WsPageTest',
	#superclass : 'TestCase',
	#category : 'WebST-Tests-Views',
	#package : 'WebST-Tests',
	#tag : 'Views'
}

{ #category : 'tests' }
WsPageTest >> testBodyBasic [

	self assert: WsBody html equals: '<body></body>'
]

{ #category : 'tests' }
WsPageTest >> testHeadBasic [

	self
		assert: WsHead html
		equals: '<head><meta charset="utf-8"/><title></title></head>'
]

{ #category : 'tests' }
WsPageTest >> testHeadTitle [

	| head |
	head := WsHead new.
	head title: 'Short and Sweet'.
	self
		assert: head html
		equals: '<head><meta charset="utf-8"/><title>Short and Sweet</title></head>' 
]

{ #category : 'tests' }
WsPageTest >> testPageBasic [

	self
		assert: WsPage html
		equals:
		'<!doctype html><html><head><meta charset="utf-8"/><title></title></head><body></body></html>'
]

{ #category : 'tests' }
WsPageTest >> testPageTitle [

	| page |
	page := WsPage new.
	page title: 'Nice title'.
	self
		assert: page html
		equals:
		'<!doctype html><html><head><meta charset="utf-8"/><title>Nice title</title></head><body></body></html>'
]
