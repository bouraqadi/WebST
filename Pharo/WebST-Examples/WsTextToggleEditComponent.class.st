Class {
	#name : #WsTextToggleEditComponent,
	#superclass : #WsComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'textReader',
		'textEditor'
	],
	#category : #'WebST-Examples-Text'
}

{ #category : #accessing }
WsTextToggleEditComponent class >> defaultTextAttribute [

	^ 'Click to edit'
]

{ #category : #'class initialization' }
WsTextToggleEditComponent class >> tagName [

	^ 'ws-editable-text'
]

{ #category : #accessing }
WsTextToggleEditComponent class >> viewClass [

	<pharoJsSkip>
	^ WsTextToggleEditView
]

{ #category : #actions }
WsTextToggleEditComponent >> cancelEdit [
	self closeEditor
]

{ #category : #actions }
WsTextToggleEditComponent >> closeEditor [
	self hide: textEditor .
	self show: textReader
]

{ #category : #accessing }
WsTextToggleEditComponent >> defaultTextAttribute [

	^ self class defaultTextAttribute
]

{ #category : #initialization }
WsTextToggleEditComponent >> initView [

	super initView.
	textReader := view querySelector: WsTextComponent tagName.
	self onClickElement: textReader do: [ self openEditor ].
	textEditor := view querySelector:
		              WsTextFieldWithButtonsComponent tagName.
	textEditor
		cancelBlock: [ self cancelEdit ];
		saveBlock: [ :newText | self saveEdit: newText ].
	self closeEditor.
	self model: textReader model.
	self text: self textAttribute
]

{ #category : #accessing }
WsTextToggleEditComponent >> model [
	^textReader model
]

{ #category : #accessing }
WsTextToggleEditComponent >> model: newModel [

	textReader model: newModel.
	textEditor	model: newModel

]

{ #category : #actions }
WsTextToggleEditComponent >> openEditor [

	self show: textEditor.
	self hide: textReader
]

{ #category : #accessing }
WsTextToggleEditComponent >> readerDisplay [

	^ textReader display
]

{ #category : #actions }
WsTextToggleEditComponent >> saveEdit: newText [

	textReader text: newText.
	self closeEditor
]

{ #category : #accessing }
WsTextToggleEditComponent >> text [
	^textReader text
]

{ #category : #accessing }
WsTextToggleEditComponent >> text: newText [

	textReader text: newText
]

{ #category : #accessing }
WsTextToggleEditComponent >> textAttribute [

	^ self dataAttributeAt: #text ifAbsent: [ self defaultTextAttribute ]
]
