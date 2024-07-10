Class {
	#name : #WsPasswordInputExampleComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField',
		'passwordPort'
	],
	#category : #'WebST-Library-Text'
}

{ #category : #accessing }
WsPasswordInputExampleComponent class >> defaultPlaceholderAttribute [

	^ ''
]

{ #category : #accessing }
WsPasswordInputExampleComponent class >> modelClass [

	^WsTextModel
]

{ #category : #'class initialization' }
WsPasswordInputExampleComponent class >> tagName [

	^'ws-password-input'
]

{ #category : #accessing }
WsPasswordInputExampleComponent class >> viewClass [

	<pharoJsSkip>
	^WsPasswordInputExampleView 
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> defaultPlaceholderAttribute [
	^self class defaultPlaceholderAttribute
]

{ #category : #actions }
WsPasswordInputExampleComponent >> displayPassword: newText [
	passwordField value: newText
]

{ #category : #initialization }
WsPasswordInputExampleComponent >> initModel [

	super initModel.
	passwordPort := model -@ #textPort.
	passwordPort => [ :newText | self displayPassword: newText ].
	self displayPassword: model text
]

{ #category : #initialization }
WsPasswordInputExampleComponent >> initView [

	super initView.
	toggleShowPasswordButton := view querySelector:
		                            WsToggleIconsComponent tagName.
	passwordField := view querySelector: 'input'.
	passwordField placeholder: self placeholderAttribute.
	toggleShowPasswordButton -@ #isOnPort
	=> [ :aBoolean | self showPasswordAsPlainText: aBoolean ].
	self
		onChangeElement: passwordField
		do: [ :newPassword | self savePassword: newPassword ]
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> password [

	^ model text
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> password: newPassword [

	model text: newPassword
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> placeholderAttribute [

	^ self
		  dataAttributeAt: #placeholder
		  ifAbsent: [ self defaultPlaceholderAttribute ]
]

{ #category : #actions }
WsPasswordInputExampleComponent >> savePassword: newPassword [
	model text: newPassword 
]

{ #category : #actions }
WsPasswordInputExampleComponent >> showPasswordAsPlainText: aBoolean [
	| newType |
	newType := aBoolean ifTrue: [ 'text' ] ifFalse: ['password'].
	passwordField type: newType
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> value [

	^ self password
]

{ #category : #accessing }
WsPasswordInputExampleComponent >> value: newPassword [

	self password: newPassword
]
