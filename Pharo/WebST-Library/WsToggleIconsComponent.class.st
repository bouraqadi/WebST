"
Upon a click, I toggle the icon of my view and notify observers via the isOnPort. 

"
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

{ #category : #initialization }
WsToggleIconsComponent class >> defaultOffIconAttribute [

	^ 'bi-toggle-off'
]

{ #category : #initialization }
WsToggleIconsComponent class >> defaultOnIconAttribute [

	^ 'bi-toggle-on'
]

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
WsToggleIconsComponent >> defaultOffIconAttribute [
	^ self class defaultOffIconAttribute
]

{ #category : #initialization }
WsToggleIconsComponent >> defaultOnIconAttribute [
	^ self class defaultOnIconAttribute
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

]

{ #category : #initialization }
WsToggleIconsComponent >> initialize [

	super initialize.
	self onClickElement: self do: [ console log: 'click'. self toggle ]
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

	^ self
		  dataAttributeAt: #offIcon
		  ifAbsent: [ self defaultOffIconAttribute ]
]

{ #category : #accessing }
WsToggleIconsComponent >> onIcon [
	^onIcon 
]

{ #category : #initialization }
WsToggleIconsComponent >> onIconAttribute [

	^ self
		  dataAttributeAt: #onIcon
		  ifAbsent: [ self defaultOnIconAttribute ]
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
WsToggleIconsComponent >> toggle [
	self model toggle
]

{ #category : #actions }
WsToggleIconsComponent >> updateDisplay [
	self isOn: model isOn
]
