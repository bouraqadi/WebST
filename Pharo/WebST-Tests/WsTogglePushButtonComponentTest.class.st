Class {
	#name : 'WsTogglePushButtonComponentTest',
	#superclass : 'WsToggleIconTextComponentTest',
	#instVars : [
		'onButton',
		'offButton'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'rendering' }
WsTogglePushButtonComponentTest class >> componentClass [

	^ WsTogglePushButtonComponent
]

{ #category : 'accessing' }
WsTogglePushButtonComponentTest class >> dataAttributes [

	^ super dataAttributes, {
		  (#onButtonCss -> 'btn-primary').
		  (#offButtonCss -> 'btn-secondary').}
]

{ #category : 'asserting' }
WsTogglePushButtonComponentTest >> assertCustomAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertCustomAttributesApplied.
	expectedOnClass := self dataAttributesDict at: #onButtonCss.
	self assert: onButton hasCssClass: expectedOnClass.
	expectedOffClass := self dataAttributesDict at: #offButtonCss.
	self assert: offButton hasCssClass: expectedOffClass
]

{ #category : 'asserting' }
WsTogglePushButtonComponentTest >> assertDefaultAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertDefaultAttributesApplied.
	expectedOnClass := self rootComponentClass defaultOnButtonCssAttribute.
	self assert: onButton hasCssClass: expectedOnClass.
	expectedOffClass := self rootComponentClass defaultOffButtonCssAttribute.
	self assert: offButton hasCssClass: expectedOffClass.

]

{ #category : 'asserting' }
WsTogglePushButtonComponentTest >> component: aComponent [
	super component: aComponent.
	onButton := shadowRoot querySelector: '#onView'.
	offButton := shadowRoot querySelector: '#offView'.
]
