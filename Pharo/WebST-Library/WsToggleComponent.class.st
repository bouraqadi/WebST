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

{ #category : 'accessing' }
WsToggleComponent >> isOn [
	^model isOn
]

{ #category : 'accessing' }
WsToggleComponent >> isOn: aBoolean [

	model isOn: aBoolean
]

{ #category : 'initialization' }
WsToggleComponent >> postConnectInitialize [

	super postConnectInitialize.
	onView := view querySelector: '#onView'.
	offView := view querySelector: '#offView'.
	isOnPort := model -@ #isOnPort.
	controller := WsToggleController new.
	controller model: model onView: onView offView: offView.

]

{ #category : 'actions' }
WsToggleComponent >> toggle [
	self model toggle
]
