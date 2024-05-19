Class {
	#name : #WsTextFieldWithButtonsTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'textDisplay'
	],
	#category : #'WebST-Tests-Examples'
}

{ #category : #accessing }
WsTextFieldWithButtonsTest class >> componentClass [

	^ WsTextFieldWithButtonsComponent 
]

{ #category : #asserting }
WsTextFieldWithButtonsTest >> assertViewModelLink [

	| newText1 newText2 input |
	input := component input.
	self assert: input value equals: model text.
	newText1 := 'new text'.
	model text: newText1.
	self assert: input value equals: newText1.
	newText2 := 'some text via UI'.
	input value: newText2.
	self assert: model text equals: newText1.
	self cancelButton click.
	self assert: model text equals: newText1.
	self assert: input value equals: newText1.
	input value: newText2.
	self assert: model text equals: newText1.
	self saveButton click.
	self assert: model text equals: newText2.
	self assert: input value equals: newText2.
	
	
	
]

{ #category : #asserting }
WsTextFieldWithButtonsTest >> cancelButton [
	^shadowRoot querySelector: '.cancelButton'
]

{ #category : #asserting }
WsTextFieldWithButtonsTest >> changeModelValues [

	model text: 'new replacement text for change model test'
]

{ #category : #asserting }
WsTextFieldWithButtonsTest >> saveButton [

	^ shadowRoot querySelector: '.saveButton'
]
