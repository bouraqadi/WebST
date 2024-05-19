Class {
	#name : #WsToggleEditTextComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'textReader',
		'textEditor'
	],
	#category : #'WebST-Examples-Text'
}

{ #category : #'class initialization' }
WsToggleEditTextComponent class >> tagName [

	^ 'ws-editable-text'
]

{ #category : #accessing }
WsToggleEditTextComponent class >> viewClass [

	<pharoJsSkip>
	^ WsToggleEditTextView
]

{ #category : #actions }
WsToggleEditTextComponent >> cancelEdit [
	self closeEditor
]

{ #category : #actions }
WsToggleEditTextComponent >> closeEditor [
	self hide: textEditor .
	self show: textReader
]

{ #category : #initialization }
WsToggleEditTextComponent >> initView [

	super initView.
	textReader := view querySelector: WsTextComponent tagName.
	self onClickElement: textReader do: [ self openEditor ].
	textEditor := view querySelector: WsTextFieldWithButtonsComponent tagName.
	textEditor
		cancelBlock: [ self cancelEdit ];
		saveBlock: [ :newText | self saveEdit: newText ].
	self closeEditor.
	self model: textReader model.

]

{ #category : #accessing }
WsToggleEditTextComponent >> model [
	^textReader model
]

{ #category : #accessing }
WsToggleEditTextComponent >> model: newModel [

	textReader model: newModel.
	textEditor	model: newModel

]

{ #category : #actions }
WsToggleEditTextComponent >> openEditor [

	self show: textEditor.
	self hide: textReader
]

{ #category : #accessing }
WsToggleEditTextComponent >> readerDisplay [

	^ textReader display
]

{ #category : #actions }
WsToggleEditTextComponent >> saveEdit: newText [

	textReader text: newText.
	self closeEditor
]

{ #category : #accessing }
WsToggleEditTextComponent >> text [
	^textReader text
]

{ #category : #accessing }
WsToggleEditTextComponent >> text: newText [

	textReader text: newText
]
