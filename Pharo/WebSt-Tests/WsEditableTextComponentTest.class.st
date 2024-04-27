Class {
	#name : #WsEditableTextComponentTest,
	#superclass : #WsComponentTest,
	#instVars : [
		'textReader',
		'textEditor',
		'textInput',
		'cancelButton',
		'saveButton'
	],
	#category : #'WebSt-Tests-Library'
}

{ #category : #accessing }
WsEditableTextComponentTest class >> componentClass [

	^ WsEditableTextComponent 
]

{ #category : #tests }
WsEditableTextComponentTest >> assertCancelEditing: newText [

	| initialText |
	initialText := self textReaderContents.
	self assert: component text equals: initialText.
	self clickElement: textReader.
	self assertEditStateWith: initialText.
	self assert: self textEditorInputValue equals: initialText.
	self changeElement: textInput value: newText.
	self clickElement: cancelButton.
	self assertDisplayStateWith: initialText.
	self assert: component text equals: initialText
]

{ #category : #tests }
WsEditableTextComponentTest >> assertComponent [

	self assertDisplayStateWith: ''.
	self assertComponentSetText: 'Bilbo The Hobbit'.
	self assertCancelEditing: 'WebSt = web components in Smalltalk'.
	self assertComponentSetText: 'Gandalf The Wizard'.
	self assertSaveEditing: 'Pharo is an open source Smalltalk'.
	self assertComponentSetText: 'The Lord of The Ring'.
	self assertCancelEditing: 'Ignore this text'.
	self assertSaveEditing: 'But, save this one'
]

{ #category : #tests }
WsEditableTextComponentTest >> assertComponentSetText: newText [

	| initialText |
	initialText := self textReaderContents.
	self assert: component text equals: initialText.
	component text: newText.
	self assert: component text equals: newText.
		self assertDisplayStateWith: newText.

]

{ #category : #tests }
WsEditableTextComponentTest >> assertDisplayStateWith: expectedText [

	self assertShowing: textReader.
	self assert: self textReaderContents equals: expectedText.
	self assertHidden: textEditor
]

{ #category : #tests }
WsEditableTextComponentTest >> assertEditStateWith: expectedText [

	self assertHidden: textReader.
	self assertShowing: textEditor.
self assert: self textEditorInputValue equals: expectedText 
]

{ #category : #tests }
WsEditableTextComponentTest >> assertSaveEditing: newText [

	| initialText |
	initialText := self textReaderContents.
	self assert: component text equals: initialText.
	self clickElement: textReader.
	self assertEditStateWith: initialText.
	self assert: self textEditorInputValue equals: initialText.
	self changeElement: textInput value: newText.
	self clickElement: saveButton.
	self assertDisplayStateWith: newText.
	self assert: component text equals: newText
]

{ #category : #accessing }
WsEditableTextComponentTest >> component: aComponent [

	| editorView |
	super component: aComponent.
	textReader := shadowRoot querySelector: WsTextComponent tagName.
	textEditor := shadowRoot querySelector: WsTextInputComponent tagName.
	editorView := textEditor view. 
	textInput :=  editorView querySelector: 'input'.
	cancelButton := editorView querySelector: '.cancelButton'.
	saveButton := editorView querySelector: '.saveButton'.
]

{ #category : #accessing }
WsEditableTextComponentTest >> textEditorInputValue [

	^ textInput value
]

{ #category : #accessing }
WsEditableTextComponentTest >> textReaderContents [

	^ textReader text
]
