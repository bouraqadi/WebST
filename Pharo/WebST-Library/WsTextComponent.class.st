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
WsTextComponent >> display [
	^display
]

{ #category : 'initialization' }
WsTextComponent >> getReady [

	super getReady.
	display := view querySelector: '.display'.
	model -@ #textPort => [ :newText | self updateDisplay: newText ].
	self updateDisplay: self text
]

{ #category : 'initialization' }
WsTextComponent >> initializeModel [
	super initializeModel.
	self ifDataAttribute: #text present: [ : newText | model text: newText ] 
]

{ #category : 'accessing' }
WsTextComponent >> text [
	^model text
]

{ #category : 'accessing' }
WsTextComponent >> text: newText [

	^ model text: newText
]

{ #category : 'actions' }
WsTextComponent >> updateDisplay: newText [
	display textContent: newText 
]
