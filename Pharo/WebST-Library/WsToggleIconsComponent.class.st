Class {
	#name : #WsToggleIconsComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'onIcon',
		'offIcon'
	],
	#category : #'WebST-Library-Buttons'
}

{ #category : #accessing }
WsToggleIconsComponent class >> modelClass [

	^WsToggleModel 
]

{ #category : #'class initialization' }
WsToggleIconsComponent class >> tagName [

	^'ws-toggle-icons'
]

{ #category : #accessing }
WsToggleIconsComponent class >> viewClass [

	<pharoJsSkip>
	^WsToggleIconsView 
]

{ #category : #initialization }
WsToggleIconsComponent >> initModel [

	super initModel.
	model -@ #isOnPort => [ :aBoolean | self showIsOnOff: aBoolean ].
	self updateDisplay
]

{ #category : #initialization }
WsToggleIconsComponent >> initView [

	super initView.
	onIcon := view querySelector: '.onIcon'.
	offIcon := view querySelector: '.offIcon'.
	onIcon classList add: self dataset onIcon.
	offIcon classList add: self dataset offIcon.
	self onClickElement: onIcon do: [ self isOn: false ].
	self onClickElement: offIcon do: [ self isOn: true ]
]

{ #category : #actions }
WsToggleIconsComponent >> isOn: aBoolean [

	model isOn: aBoolean
]

{ #category : #actions }
WsToggleIconsComponent >> showIsOff [

	self hide: onIcon.
	self show: offIcon
]

{ #category : #actions }
WsToggleIconsComponent >> showIsOn [
	self show: onIcon.
	self hide: offIcon
]

{ #category : #actions }
WsToggleIconsComponent >> showIsOnOff: aBoolean [

	aBoolean ifTrue: [ ^ self showIsOn ].
	self showIsOff
]

{ #category : #actions }
WsToggleIconsComponent >> updateDisplay [
	self isOn: model isOn
]
