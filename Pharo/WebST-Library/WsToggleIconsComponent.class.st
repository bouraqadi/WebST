Class {
	#name : #WsToggleIconsComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'onIcon',
		'offIcon',
		'isOnPort'
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

{ #category : #accessing }
WsToggleIconsComponent >> icons [

	^ {self onIcon. self offIcon}
]

{ #category : #initialization }
WsToggleIconsComponent >> initModel [

	super initModel.
	isOnPort := model -@ #isOnPort.
	isOnPort => [ :aBoolean | self showIsOnOff: aBoolean ].
	self updateDisplay
]

{ #category : #initialization }
WsToggleIconsComponent >> initView [

	super initView.
	onIcon := view querySelector: '.onIcon'.
	offIcon := view querySelector: '.offIcon'.
	onIcon classList add: self onIconAttribute.
	offIcon classList add: self offIconAttribute.
	self onClickElement: onIcon do: [ self isOn: false ].
	self onClickElement: offIcon do: [ self isOn: true ]
]

{ #category : #accessing }
WsToggleIconsComponent >> isOn [
	^model isOn
]

{ #category : #accessing }
WsToggleIconsComponent >> isOn: aBoolean [

	model isOn: aBoolean
]

{ #category : #accessing }
WsToggleIconsComponent >> offIcon [

	^ offIcon
]

{ #category : #initialization }
WsToggleIconsComponent >> offIconAttribute [

	^ self dataAttributeAt: #offIcon ifAbsent: [ 'bi-toggle-off' ]
]

{ #category : #accessing }
WsToggleIconsComponent >> onIcon [
	^onIcon 
]

{ #category : #initialization }
WsToggleIconsComponent >> onIconAttribute [

	^ self dataAttributeAt: #onIcon ifAbsent: [ 'bi-toggle-on' ]
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
