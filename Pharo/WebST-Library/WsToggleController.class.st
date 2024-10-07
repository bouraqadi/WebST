Class {
	#name : 'WsToggleController',
	#superclass : 'PjDomController',
	#instVars : [
		'onView',
		'offView',
		'model'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsToggleController >> isOn [
	^model isOn
]

{ #category : 'accessing' }
WsToggleController >> isOn: aBoolean [
	model isOn: aBoolean
]

{ #category : 'accessing' }
WsToggleController >> model [

	^ model
]

{ #category : 'accessing' }
WsToggleController >> model: anObject [

	model := anObject.
	model -@ #isOnPort => [ :aBoolean | self showIsOnOff: aBoolean ].

]

{ #category : 'initialization' }
WsToggleController >> model: aToggleModel onView: newOnView offView: newOffView [
	self model: aToggleModel.
	self onView: newOnView.
	self offView: newOffView.
	self updateDisplay
]

{ #category : 'accessing' }
WsToggleController >> offView [

	^ offView
]

{ #category : 'accessing' }
WsToggleController >> offView: anObject [

	offView := anObject.
	self onClickElement: offView do: [ self isOn: true ]
]

{ #category : 'accessing' }
WsToggleController >> onView [

	^ onView
]

{ #category : 'accessing' }
WsToggleController >> onView: anObject [

	onView := anObject.
	self onClickElement: onView do: [ self isOn: false ]
]

{ #category : 'actions' }
WsToggleController >> showIsOff [

	self hide: onView.
	self show: offView
]

{ #category : 'actions' }
WsToggleController >> showIsOn [
	self show: onView.
	self hide: offView
]

{ #category : 'actions' }
WsToggleController >> showIsOnOff: aBoolean [

	aBoolean ifTrue: [ ^ self showIsOn ].
	self showIsOff
]

{ #category : 'actions' }
WsToggleController >> updateDisplay [
	self showIsOnOff: self isOn
]
