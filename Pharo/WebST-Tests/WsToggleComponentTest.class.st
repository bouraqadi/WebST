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
WsToggleComponentTest >> assertComponent [ 
	super assertComponent.
	self assertOnPort
]

{ #category : 'asserting' }
WsToggleComponentTest >> assertOnPort [
	window instVarNamed: #toggleFlag put: 123.
	self evalBlock: [component -@ #isOnPort => [: aBoolean | window toggleFlag: aBoolean  ]].
	#(true false true false) do: [: each |
		component isOn: each .
		self assert: window toggleFlag equals: each.]
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
	component offView click.
	self assert: model isOn.
	self assertShowing: onView.
	self assertHidden: offView.
	component onView click.
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
