Class {
	#name : #WsToggleIconsComponentTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'onIcon',
		'offIcon'
	],
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsToggleIconsComponentTest class >> componentClass [

	^ WsToggleIconsComponent
]

{ #category : #accessing }
WsToggleIconsComponentTest class >> dataAttributes [

	^ {
		  (#onIcon -> 'bi-circle-fill').
		  (#offIcon -> 'bi-circle') }
]

{ #category : #asserting }
WsToggleIconsComponentTest >> assert: domElement isShowing: aBoolean [
	aBoolean ifTrue: [ ^self assertShowing: domElement ].
	self assertHidden: domElement 

]

{ #category : #asserting }
WsToggleIconsComponentTest >> assertCustomAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertCustomAttributesApplied.
	expectedOnClass := self dataAttributesDict at: #onIcon.
	self assert: onIcon hasCssClass: expectedOnClass.
	expectedOffClass := self dataAttributesDict at: #offIcon.
	self assert: offIcon hasCssClass: expectedOffClass
]

{ #category : #asserting }
WsToggleIconsComponentTest >> assertDefaultAttributesApplied [

	| expectedOnClass expectedOffClass |
	super assertDefaultAttributesApplied.
	expectedOnClass := self rootComponentClass defaultOnIconAttribute.
	self assert: onIcon hasCssClass: expectedOnClass.
	expectedOffClass := self rootComponentClass defaultOffIconAttribute.
	self assert: offIcon hasCssClass: expectedOffClass
]

{ #category : #asserting }
WsToggleIconsComponentTest >> assertViewModelLink [

	self assert: onIcon isShowing: model isOn.
	self assert: offIcon isShowing: model isOn not.
	2 timesRepeat: [
		model switchOn.
		self assertShowing: onIcon.
		self assertHidden: offIcon ].
	2 timesRepeat: [
		model switchOff.
		self assertHidden: onIcon.
		self assertShowing: offIcon ].
	offIcon click.
	self assert: model isOn.
	self assertShowing: onIcon.
	self assertHidden: offIcon.
	onIcon click.
	self deny: model isOn.
	self assertHidden: onIcon.
	self assertShowing: offIcon
]

{ #category : #asserting }
WsToggleIconsComponentTest >> changeModelValues [

	model isOn: model isOn not
]

{ #category : #accessing }
WsToggleIconsComponentTest >> component: aComponent [

	super component: aComponent.
	onIcon := shadowRoot querySelector: '.onIcon'.
	offIcon := shadowRoot querySelector: '.offIcon'.
]
