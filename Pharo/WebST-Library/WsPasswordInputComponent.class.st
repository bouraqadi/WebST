Class {
	#name : 'WsPasswordInputComponent',
	#superclass : 'WsMvcComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField'
	],
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'accessing' }
WsPasswordInputComponent class >> defaultPlaceholderAttribute [

	^ ''
]

{ #category : 'accessing' }
WsPasswordInputComponent class >> modelClass [

	^WsTextModel
]

{ #category : 'class initialization' }
WsPasswordInputComponent class >> tagName [

	^'ws-password-input'
]

{ #category : 'accessing' }
WsPasswordInputComponent class >> viewClass [

	<pharoJsSkip>
	^WsPasswordInputView 
]

{ #category : 'accessing' }
WsPasswordInputComponent >> defaultPlaceholderAttribute [
	^self class defaultPlaceholderAttribute
]

{ #category : 'actions' }
WsPasswordInputComponent >> displayPassword: newText [
	passwordField value: newText
]

{ #category : 'initialization' }
WsPasswordInputComponent >> getReady [

	super getReady.
	toggleShowPasswordButton := self viewFirstComponent: WsShowHideToggleComponent.
	self 
		when: toggleShowPasswordButton 
		isReadyDo: [ self initToggleShowPasswordButton ].
	passwordField := view querySelector: 'input'.
	passwordField placeholder: self placeholderAttribute.
	self
		onChangeElement: passwordField
		do: [ :newPassword | self savePassword: newPassword ].
	model -@ #textPort => [ :newText | self displayPassword: newText ].
	self displayPassword: model text
]

{ #category : 'initialization' }
WsPasswordInputComponent >> initToggleShowPasswordButton [

	toggleShowPasswordButton -@ #isOnPort => [ :aBoolean | 
		self showPasswordAsPlainText: aBoolean ].

]

{ #category : 'accessing' }
WsPasswordInputComponent >> password [

	^ model text
]

{ #category : 'accessing' }
WsPasswordInputComponent >> password: newPassword [

	model text: newPassword
]

{ #category : 'accessing' }
WsPasswordInputComponent >> placeholderAttribute [

	^ self
		  dataAttributeAt: #placeholder
		  ifAbsent: [ self defaultPlaceholderAttribute ]
]

{ #category : 'actions' }
WsPasswordInputComponent >> savePassword: newPassword [
	model text: newPassword 
]

{ #category : 'actions' }
WsPasswordInputComponent >> showPasswordAsPlainText: aBoolean [
	| newType |
	newType := aBoolean ifTrue: [ 'text' ] ifFalse: ['password'].
	passwordField type: newType
]

{ #category : 'accessing' }
WsPasswordInputComponent >> value [

	^ self password
]

{ #category : 'accessing' }
WsPasswordInputComponent >> value: newPassword [

	self password: newPassword
]
