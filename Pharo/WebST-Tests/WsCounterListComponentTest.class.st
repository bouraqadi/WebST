Class {
	#name : 'WsCounterListComponentTest',
	#superclass : 'WsListComponentTest',
	#category : 'WebST-Tests-Examples',
	#package : 'WebST-Tests',
	#tag : 'Examples'
}

{ #category : 'accessing' }
WsCounterListComponentTest class >> componentClass [

	^ WsCounterListComponent
]

{ #category : 'asserting' }
WsCounterListComponentTest >> changeModelValues [
	self evalBlock: [
		#( 42 35 21 ) do: [ :each | model add: (WsCounterModel count: each) ] ]
]

{ #category : 'asserting' }
WsCounterListComponentTest >> itemComponentAsserter [
	^WsCounterComponentTestAsserter
]
