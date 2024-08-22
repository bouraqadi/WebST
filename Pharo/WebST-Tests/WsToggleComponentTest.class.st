Class {
	#name : 'WsToggleComponentTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'onView',
		'offView'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'testing' }
WsToggleComponentTest class >> isAbstract [ 
	^self == WsToggleComponentTest 
]

{ #category : 'asserting' }
WsToggleComponentTest >> assertViewModelLink [

	self assert: onView isShowing: model isOn.
	self assert: offView isShowing: model isOn not.
	2 timesRepeat: [
		model switchOn.
		self assertShowing: onView.
		self assertHidden: offView ].
	2 timesRepeat: [
		model switchOff.
		self assertHidden: onView.
		self assertShowing: offView ].
	component click.
	self assert: model isOn.
	self assertShowing: onView.
	self assertHidden: offView.
	component click.
	self deny: model isOn.
	self assertHidden: onView.
	self assertShowing: offView
]

{ #category : 'accessing' }
WsToggleComponentTest >> component: aComponent [

	super component: aComponent.
	onView := shadowRoot querySelector: '#onView'.
	offView := shadowRoot querySelector: '#offView'
]
