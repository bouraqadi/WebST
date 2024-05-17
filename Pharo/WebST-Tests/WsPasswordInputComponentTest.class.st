Class {
	#name : #WsPasswordInputComponentTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField'
	],
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsPasswordInputComponentTest class >> componentClass [

	^ WsPasswordInputComponent 
]

{ #category : #asserting }
WsPasswordInputComponentTest >> assertViewModelLink [

	| password1 password2 |
	self assert: passwordField value equals: model text.
	password1 := 'very secrete'.
	self changeElement: passwordField value: password1.
	self assert: model text equals: password1.
	self clickPasswordDisplayIcon.
	self assert: passwordField type equals: 'text'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	self clickPasswordDisplayIcon.
	self assert: passwordField type equals: 'password'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	password2 := 'hush!!!!'.
	self changeElement: passwordField value: password2.
	self assert: model text equals: password2
]

{ #category : #asserting }
WsPasswordInputComponentTest >> changeModelValues [

	model text: 'new secret password'
]

{ #category : #asserting }
WsPasswordInputComponentTest >> clickPasswordDisplayIcon [

	| showingIcon |
	showingIcon := toggleShowPasswordButton icons asLocalObject detect: [ :each |
		               self isShowing: each ].
	showingIcon click
]

{ #category : #accessing }
WsPasswordInputComponentTest >> component: newComponent [

	super component: newComponent.
	toggleShowPasswordButton := shadowRoot querySelector:
		                WsToggleIconsComponent tagName.
	passwordField := shadowRoot querySelector: 'input'
]
