Class {
	#name : 'WsCounterComponent',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'display'
	],
	#category : 'WebST-Library-Counter',
	#package : 'WebST-Library',
	#tag : 'Counter'
}

{ #category : 'instance creation' }
WsCounterComponent class >> count: anInteger [
	^self new
		count: anInteger;
		yourself
]

{ #category : 'accessing' }
WsCounterComponent class >> modelClass [ 
	^WsCounterModel 
]

{ #category : 'class initialization' }
WsCounterComponent class >> tagName [
	^'ws-counter'
]

{ #category : 'accessing' }
WsCounterComponent class >> viewClass [
<pharoJsSkip>
	^ WsCounterView
]

{ #category : 'initialization' }
WsCounterComponent >> count: anInteger [

	model count: anInteger
]

{ #category : 'actions' }
WsCounterComponent >> decrement [

	model decrement
]

{ #category : 'actions' }
WsCounterComponent >> displayCount: newCount [

	display textContent: newCount
]

{ #category : 'actions' }
WsCounterComponent >> increment [

	model increment
]

{ #category : 'initialization' }
WsCounterComponent >> preConnectInitialize [

	| incrementButton decrementButton resetButton |
	super preConnectInitialize.
	display := view firstElementByCssClass: 'display'.
	incrementButton := view firstElementByCssClass: 'increment'.
	self onClickElement: incrementButton do: [ self increment ].
	decrementButton := view firstElementByCssClass: 'decrement'.
	self onClickElement: decrementButton do: [ self decrement ].
	resetButton := view firstElementByCssClass: 'reset'.
	self onClickElement: resetButton do: [ self resetCount ].
	model -@ #countPort => [ :newCount |
		self displayCount: newCount ].
	self updateDisplay
]

{ #category : 'actions' }
WsCounterComponent >> resetCount [

	model resetCount
]

{ #category : 'actions' }
WsCounterComponent >> updateDisplay [

	self displayCount: model count
]
