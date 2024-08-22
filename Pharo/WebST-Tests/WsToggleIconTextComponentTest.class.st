Class {
	#name : 'WsToggleIconTextComponentTest',
	#superclass : 'WsToggleComponentTest',
	#instVars : [
		'onIcon',
		'onText',
		'offIcon',
		'offText'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsToggleIconTextComponentTest class >> componentClass [

	^ WsToggleIconTextComponent 
]

{ #category : 'accessing' }
WsToggleIconTextComponentTest class >> dataAttributes [

	^ {
		  (#onIcon -> 'bi-circle-fill').
		(#onText -> 'Running').
		  (#offIcon -> 'bi-circle').
		(#offText -> 'Stopped') }
]

{ #category : 'asserting' }
WsToggleIconTextComponentTest >> assertCustomAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertCustomAttributesApplied.
	expectedOnClass := self dataAttributesDict at: #onIcon.
	self assert: onIcon hasCssClass: expectedOnClass.
	self assert: onText textContent equalsDataAttributeAt: #onText.
	expectedOffClass := self dataAttributesDict at: #offIcon.
	self assert: offIcon hasCssClass: expectedOffClass.
	self assert: offText textContent equalsDataAttributeAt: #offText.

]

{ #category : 'asserting' }
WsToggleIconTextComponentTest >> assertDefaultAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertDefaultAttributesApplied.
	expectedOnClass := self rootComponentClass defaultOnIconAttribute.
	self assert: onIcon hasCssClass: expectedOnClass.
	self assertHidden: onText.
	expectedOffClass := self rootComponentClass defaultOffIconAttribute.
	self assert: offIcon hasCssClass: expectedOffClass.
	self assertHidden: offText.

]

{ #category : 'asserting' }
WsToggleIconTextComponentTest >> component: aComponent [

	super component: aComponent.
	onIcon := component onController iconElement.
	offIcon := component offController iconElement.
	onText := component onController textElement.
	offText := component offController textElement
]
