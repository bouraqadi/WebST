Class {
	#name : 'WsToggleIconTextComponent',
	#superclass : 'WsToggleComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'onController',
		'offController'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'class initialization' }
WsToggleIconTextComponent class >> tagName [

	^ 'ws-toggle-icon-text'
]

{ #category : 'accessing' }
WsToggleIconTextComponent class >> viewClass [

	<pharoJsSkip>
	^ WsToggleIconTextRowView
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> defaultOffIconAttribute [
	^ self class defaultOffIconAttribute
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> defaultOnIconAttribute [
	^ self class defaultOnIconAttribute
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> initView [

	super initView.
	onController := WsIconTextRowController container: onView.
	onController icon: self onIconAttribute; text: self onTextAttribute.
	offController := WsIconTextRowController container: offView.
	offController icon: self offIconAttribute; text: self offTextAttribute.

]

{ #category : 'initialization' }
WsToggleIconTextComponent >> offIconAttribute [

	^ self
		  dataAttributeAt: #offIcon
		  ifAbsent: [ self defaultOffIconAttribute ]
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> offTextAttribute [

	^ self
		  dataAttributeAt: #offText
		  ifAbsent: [ nil ]
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> onIconAttribute [

	^ self
		  dataAttributeAt: #onIcon
		  ifAbsent: [ self defaultOnIconAttribute ]
]

{ #category : 'initialization' }
WsToggleIconTextComponent >> onTextAttribute [

	^ self
		  dataAttributeAt: #onText
		  ifAbsent: [ nil ]
]
