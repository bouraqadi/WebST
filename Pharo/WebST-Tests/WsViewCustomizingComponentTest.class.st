Class {
	#name : 'WsViewCustomizingComponentTest',
	#superclass : 'WsComponentTest',
	#category : 'WebST-Tests-ViewCustomization',
	#package : 'WebST-Tests',
	#tag : 'ViewCustomization'
}

{ #category : 'accessing' }
WsViewCustomizingComponentTest class >> componentClass [

	^WsViewCustomizingComponent
]

{ #category : 'asserting' }
WsViewCustomizingComponentTest >> assertComponent [

	| customizedView |
	customizedView := shadowRoot querySelector: 'p'.
	self
		assert: customizedView textContent
		equals: WsViewCustomizingComponent viewTextContent
]
