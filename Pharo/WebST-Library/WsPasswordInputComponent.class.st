Class {
	#name : #WsPasswordInputComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField'
	],
	#category : #'WebST-Library-Text'
}

{ #category : #accessing }
WsPasswordInputComponent class >> modelClass [

	^WsTextModel
]

{ #category : #'class initialization' }
WsPasswordInputComponent class >> tagName [

	^'ws-password-input'
]

{ #category : #accessing }
WsPasswordInputComponent class >> viewClass [

	<pharoJsSkip>
	^WsPasswordInputView 
]

{ #category : #actions }
WsPasswordInputComponent >> displayPassword: newText [
	passwordField value: newText
]

{ #category : #initialization }
WsPasswordInputComponent >> initModel [

	super initModel.
	model -@ #textPort => [ :newText | self displayPassword: newText ].
	self displayPassword: model text
]

{ #category : #initialization }
WsPasswordInputComponent >> initView [
	super initView.
	toggleShowPasswordButton := view querySelector:
		                            WsToggleIconsComponent tagName.
	passwordField := view querySelector: 'input'.
	toggleShowPasswordButton -@ #isOnPort => [ : aBoolean | self showPasswordAsPlainText: aBoolean ].
	self onChangeElement: passwordField do: [: newPassword | self savePassword: newPassword ]
]

{ #category : #actions }
WsPasswordInputComponent >> savePassword: newPassword [
	model text: newPassword 
]

{ #category : #actions }
WsPasswordInputComponent >> showPasswordAsPlainText: aBoolean [
	| newType |
	newType := aBoolean ifTrue: [ 'text' ] ifFalse: ['password'].
	passwordField type: newType
]
