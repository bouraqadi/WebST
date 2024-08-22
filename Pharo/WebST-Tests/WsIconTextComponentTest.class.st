Class {
	#name : 'WsIconTextComponentTest',
	#superclass : 'WsComponentTest',
	#instVars : [
		'textElement',
		'iconElement'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsIconTextComponentTest class >> componentClass [

	^ WsIconTextComponent 
]

{ #category : 'accessing' }
WsIconTextComponentTest class >> dataAttributes [

	^{#icon -> 'bi-alarm'. #text -> 'Alarm Clock'}
]

{ #category : 'asserting' }
WsIconTextComponentTest >> assertComponent [

	| marginLeft |
	component text: nil.
	self assertHidden: textElement.
	component text: 'someText'.
	self assertShowing: textElement.
	marginLeft := (self computedStyleOf: textElement) marginLeft asNumber.
	self assert: marginLeft > 0.
	component text: nil.
	self assertHidden: textElement
]

{ #category : 'asserting' }
WsIconTextComponentTest >> assertCustomAttributesApplied [

	| iconAttribute |
	super assertCustomAttributesApplied.
	iconAttribute := self dataAttributesDict at: #icon.
	self assert: (iconElement classList contains: iconAttribute)
]

{ #category : 'asserting' }
WsIconTextComponentTest >> assertDefaultAttributesApplied [

	| iconAttribute |
	super assertDefaultAttributesApplied.
	iconAttribute := self rootComponentClass defaultIconAttribute.
	self assert: (iconElement classList contains: iconAttribute)
]

{ #category : 'accessing' }
WsIconTextComponentTest >> component: aComponent [

	| controller |
	super component: aComponent.
	controller := component controller.
	textElement := controller textElement.
	iconElement := controller iconElement
]
