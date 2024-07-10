Class {
	#name : #WsTextFieldWithButtonsComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'input',
		'cancelBlock',
		'saveBlock'
	],
	#category : #'WebST-Library-Text'
}

{ #category : #accessing }
WsTextFieldWithButtonsComponent class >> modelClass [

	^WsTextModel 
]

{ #category : #'class initialization' }
WsTextFieldWithButtonsComponent class >> tagName [

	^'ws-text-input'
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent class >> viewClass [

	<pharoJsSkip>
	^WsTextFieldWithButtonsView 
]

{ #category : #actions }
WsTextFieldWithButtonsComponent >> cancel [

	self displayModelText.
	self cancelBlock value
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent >> cancelBlock [

	^ cancelBlock
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent >> cancelBlock: anObject [

	cancelBlock := anObject
]

{ #category : #actions }
WsTextFieldWithButtonsComponent >> displayModelText [

	self displayText: model text
]

{ #category : #actions }
WsTextFieldWithButtonsComponent >> displayText: aString [

	input value: aString
]

{ #category : #initialization }
WsTextFieldWithButtonsComponent >> initModel [

	super initModel.
	model -@ #textPort => [ :newText | self displayText: newText ].
	self displayModelText
]

{ #category : #initialization }
WsTextFieldWithButtonsComponent >> initView [

	| cancelButton saveButton |
	super initView .
	input := view querySelector: '.textInput'.
	cancelButton := view querySelector: '.cancelButton'.
	self onClickElement: cancelButton do: [ self cancel ].
	saveButton := view querySelector: '.saveButton'.
	self onClickElement: saveButton do: [ self save ]
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent >> inputValue [
	^input value
]

{ #category : #actions }
WsTextFieldWithButtonsComponent >> save [

	self updateModelText.
	self saveBlock ifNil: [^self].
	self saveBlock value: input value
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent >> saveBlock [

	^ saveBlock
]

{ #category : #accessing }
WsTextFieldWithButtonsComponent >> saveBlock: anObject [

	saveBlock := anObject
]

{ #category : #actions }
WsTextFieldWithButtonsComponent >> updateModelText [

	model text: input value
]
