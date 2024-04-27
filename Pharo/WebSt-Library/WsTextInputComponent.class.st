Class {
	#name : #WsTextInputComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'input',
		'cancelBlock',
		'saveBlock'
	],
	#category : #'WebSt-Library-Text'
}

{ #category : #accessing }
WsTextInputComponent class >> modelClass [

	^WsTextModel 
]

{ #category : #'class initialization' }
WsTextInputComponent class >> tagName [

	^'ws-text-input'
]

{ #category : #accessing }
WsTextInputComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextInputView 
]

{ #category : #actions }
WsTextInputComponent >> cancel [

	self displayModelText.
	self cancelBlock value
]

{ #category : #accessing }
WsTextInputComponent >> cancelBlock [

	^ cancelBlock
]

{ #category : #accessing }
WsTextInputComponent >> cancelBlock: anObject [

	cancelBlock := anObject
]

{ #category : #actions }
WsTextInputComponent >> displayModelText [

	self displayText: model text
]

{ #category : #actions }
WsTextInputComponent >> displayText: aString [

	input value: aString
]

{ #category : #initialization }
WsTextInputComponent >> initModel [

	super initModel.
	model -@ #textPort => [ :newText | self displayText: newText ].
	self displayModelText
]

{ #category : #initialization }
WsTextInputComponent >> initView [

	| cancelButton saveButton |
	super initView .
	input := view querySelector: '.textInput'.
	cancelButton := view querySelector: '.cancelButton'.
	self onClickElement: cancelButton do: [ self cancel ].
	saveButton := view querySelector: '.saveButton'.
	self onClickElement: saveButton do: [ self save ]
]

{ #category : #accessing }
WsTextInputComponent >> inputValue [
	^input value
]

{ #category : #actions }
WsTextInputComponent >> save [

	self updateModelText.
	self saveBlock ifNil: [^self].
	self saveBlock value: input value
]

{ #category : #accessing }
WsTextInputComponent >> saveBlock [

	^ saveBlock
]

{ #category : #accessing }
WsTextInputComponent >> saveBlock: anObject [

	saveBlock := anObject
]

{ #category : #actions }
WsTextInputComponent >> updateModelText [

	model text: input value
]
