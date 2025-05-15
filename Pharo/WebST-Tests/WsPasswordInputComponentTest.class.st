Class {
	#name : 'WsPasswordInputComponentTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField'
	],
	#category : 'WebST-Tests-Library',
	#package : 'WebST-Tests',
	#tag : 'Library'
}

{ #category : 'accessing' }
WsPasswordInputComponentTest class >> componentClass [

	^ WsPasswordInputComponent 
]

{ #category : 'accessing' }
WsPasswordInputComponentTest class >> dataAttributes [
	^{#placeholder -> 'New Password'}
]

{ #category : 'asserting' }
WsPasswordInputComponentTest >> assertCustomAttributesApplied [

	super assertCustomAttributesApplied.
	self
		assert: passwordField placeholder
		equalsDataAttributeAt: #placeholder
]

{ #category : 'asserting' }
WsPasswordInputComponentTest >> assertDefaultAttributesApplied [

	super assertDefaultAttributesApplied.
	self
		assert: passwordField placeholder
		equals: self componentClass defaultPlaceholderAttribute 
		
]

{ #category : 'asserting' }
WsPasswordInputComponentTest >> assertViewModelLink [

	| password1 password2 password3 |
	self assert: passwordField value equals: model text.
	password1 := 'very secrete'.
	self changeElement: passwordField value: password1.
	self assert: model text equals: password1.
	self clickToggleButton.
	self assert: passwordField type equals: 'text'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	self clickToggleButton.
	self assert: passwordField type equals: 'password'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	password2 := 'hush!!!!'.
	self changeElement: passwordField value: password2.
	self assert: model text equals: password2.
	password3 := 'new secret password'.
	model text: password3.
	self assert: passwordField value equals: password3
]

{ #category : 'asserting' }
WsPasswordInputComponentTest >> clickToggleButton [

	self toggleButtonVisibleView click
]

{ #category : 'accessing' }
WsPasswordInputComponentTest >> component: newComponent [

	super component: newComponent.
	toggleShowPasswordButton := shadowRoot querySelector:
		                            WsShowHideToggleComponent tagName.
	passwordField := shadowRoot querySelector: 'input'
]

{ #category : 'asserting' }
WsPasswordInputComponentTest >> toggleButtonVisibleView [

	(self isShowing: toggleShowPasswordButton onView) ifTrue:  [ ^toggleShowPasswordButton onView ].
	^toggleShowPasswordButton offView
]
