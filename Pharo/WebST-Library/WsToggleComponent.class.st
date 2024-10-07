"
Upon a click, I toggle the icon of my view and notify observers via the isOnPort. 

"
Class {
	#name : 'WsToggleComponent',
	#superclass : 'WsMvcComponent',
	#instVars : [
		'isOnPort',
		'controller',
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
	controller := WsToggleController new.
	controller model: model onView: onView offView: offView.

]

{ #category : 'initialization' }
WsToggleComponent >> initView [

	super initView.
	onView := view querySelector: '#onView'.
	offView := view querySelector: '#offView'.
 
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
WsToggleComponent >> toggle [
	self model toggle
]
