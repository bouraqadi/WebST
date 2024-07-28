Class {
	#name : 'WsCompositeComponentInitSubViewTest',
	#superclass : 'WsComponentTest',
	#category : 'WebST-Tests-Examples',
	#package : 'WebST-Tests',
	#tag : 'Examples'
}

{ #category : 'accessing' }
WsCompositeComponentInitSubViewTest class >> componentClass [
	^WsCompositeComponentInitSubView
]

{ #category : 'asserting' }
WsCompositeComponentInitSubViewTest >> assertComponent [

	| subView |
	subView := shadowRoot querySelector: 'p'.
	self assert: subView textContent equals: WsCompositeInitSubView subViewTextContent 
]
