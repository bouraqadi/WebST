"
Upon a click, I toggle the icon of my view and notify observers via the isOnPort. 

"
Class {
	#name : 'WsToggleComponent',
	#superclass : 'WsMvcComponent',
	#instVars : [
		'isOnPort',
		'clickHandler',
		'onView',
		'offView'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'initialization' }
WsToggleComponent class >> defaultOffIconAttribute [

	^ 'bi-toggle-off'
]

{ #category : 'initialization' }
WsToggleComponent class >> defaultOnIconAttribute [

	^ 'bi-toggle-on'
]

{ #category : 'accessing' }
WsToggleComponent class >> modelClass [

	^WsToggleModel 
]

{ #category : 'initialization' }
WsToggleComponent >> initModel [

	super initModel.
	isOnPort := model -@ #isOnPort.
	isOnPort => [ :aBoolean | self showIsOnOff: aBoolean ].
	self updateDisplay
]

{ #category : 'initialization' }
WsToggleComponent >> initToggleOnClick [

	"Remember the handler to avoid duplicates, in cases when the view is reset, such as upon changing the model"
	clickHandler ifNotNil: [ ^ self ].
	clickHandler := [ self toggle ].
	self onClickElement: self do: clickHandler
]

{ #category : 'initialization' }
WsToggleComponent >> initView [

	super initView.
	onView := view querySelector: '#onView'.
	offView := view querySelector: '#offView'.
	self initToggleOnClick
]

{ #category : 'accessing' }
WsToggleComponent >> isOn [
	^model isOn
]

{ #category : 'accessing' }
WsToggleComponent >> isOn: aBoolean [

	model isOn: aBoolean
]

{ #category : 'actions' }
WsToggleComponent >> showIsOff [

	self hide: onView.
	self show: offView
]

{ #category : 'actions' }
WsToggleComponent >> showIsOn [
	self show: onView.
	self hide: offView
]

{ #category : 'actions' }
WsToggleComponent >> showIsOnOff: aBoolean [

	aBoolean ifTrue: [ ^ self showIsOn ].
	self showIsOff
]

{ #category : 'actions' }
WsToggleComponent >> toggle [
	self model toggle
]

{ #category : 'actions' }
WsToggleComponent >> updateDisplay [
	self isOn: model isOn
]
