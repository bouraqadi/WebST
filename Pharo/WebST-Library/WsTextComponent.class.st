Class {
	#name : 'WsTextComponent',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'display'
	],
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'accessing' }
WsTextComponent class >> defaultTextAttribute [
	^'...'
]

{ #category : 'accessing' }
WsTextComponent class >> modelClass [

	^WsTextModel 
]

{ #category : 'class initialization' }
WsTextComponent class >> tagName [

	^'ws-text'
]

{ #category : 'instance creation' }
WsTextComponent class >> text: newText [
	^self new
		text: newText;
		yourself
]

{ #category : 'accessing' }
WsTextComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextView
]

{ #category : 'accessing' }
WsTextComponent >> defaultTextAttribute [
	^ self class defaultTextAttribute
]

{ #category : 'accessing' }
WsTextComponent >> display [
	^display
]

{ #category : 'initialization' }
WsTextComponent >> initModel [

	super initModel.
	model -@ #textPort => [ :newText | self updateDisplay: newText ].
	model text: self textAttribute
]

{ #category : 'initialization' }
WsTextComponent >> initView [

	super initView.
	display := view querySelector: '.display'
]

{ #category : 'accessing' }
WsTextComponent >> text [
	^model text
]

{ #category : 'accessing' }
WsTextComponent >> text: newText [

	^ model text: newText
]

{ #category : 'accessing' }
WsTextComponent >> textAttribute [

	^ self
		  dataAttributeAt: #text
		  ifAbsent: [ self defaultTextAttribute ]
]

{ #category : 'actions' }
WsTextComponent >> updateDisplay: newText [
	display textContent: newText 
]
