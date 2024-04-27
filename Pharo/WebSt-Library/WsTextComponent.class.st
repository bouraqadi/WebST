Class {
	#name : #WsTextComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'display'
	],
	#category : #'WebSt-Library-Text'
}

{ #category : #accessing }
WsTextComponent class >> modelClass [

	^WsTextModel 
]

{ #category : #'class initialization' }
WsTextComponent class >> tagName [

	^'ws-text'
]

{ #category : #'instance creation' }
WsTextComponent class >> text: newText [
	^self new
		text: newText;
		yourself
]

{ #category : #accessing }
WsTextComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextView
]

{ #category : #accessing }
WsTextComponent >> display [
	^display
]

{ #category : #initialization }
WsTextComponent >> initModel [

	super initModel.
	model -@ #textPort => [ :newText | self updateDisplay: newText ].
	self updateDisplay: model text
]

{ #category : #initialization }
WsTextComponent >> initView [

	super initView.
	display := view querySelector: '.display'
]

{ #category : #accessing }
WsTextComponent >> text [
	^model text
]

{ #category : #accessing }
WsTextComponent >> text: newText [

	^ model text: newText
]

{ #category : #actions }
WsTextComponent >> updateDisplay: newText [
	display textContent: newText 
]
