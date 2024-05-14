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
WsToggleIconsComponentTest class >> attributs [

	^ {
		  (#onIcon -> 'bi-circle-fill').
		  (#offIcon -> 'bi-circle') }
]

{ #category : #accessing }
WsToggleIconsComponentTest class >> componentClass [

	^ WsToggleIconsComponent
]

{ #category : #asserting }
WsToggleIconsComponentTest >> assert: domElement isShowing: aBoolean [
	aBoolean ifTrue: [ ^self assertShowing: domElement ].
	self assertHidden: domElement 

]

{ #category : #asserting }
WsToggleIconsComponentTest >> assertViewModelLink [

	self assert: onIcon isShowing: model isOn.
	self assert: offIcon isShowing: model isOn.
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
