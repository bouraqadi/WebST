Class {
	#name : 'WsPasswordInputExampleComponentTest',
	#superclass : 'WsMvcComponentTest',
	#instVars : [
		'toggleShowPasswordButton',
		'passwordField'
	],
	#category : 'WebST-Tests-Examples',
	#package : 'WebST-Tests',
	#tag : 'Examples'
}

{ #category : 'accessing' }
WsPasswordInputExampleComponentTest class >> componentClass [

	^ WsPasswordInputExampleComponent 
]

{ #category : 'accessing' }
WsPasswordInputExampleComponentTest class >> dataAttributes [
	^{#placeholder -> 'New Password'}
]

{ #category : 'asserting' }
WsPasswordInputExampleComponentTest >> assertCustomAttributesApplied [

	super assertCustomAttributesApplied.
	self
		assert: passwordField placeholder
		equals: (self dataAttributesDict at: #placeholder)
]

{ #category : 'asserting' }
WsPasswordInputExampleComponentTest >> assertDefaultAttributesApplied [

	super assertDefaultAttributesApplied.
	self
		assert: passwordField placeholder
		equals: self rootComponentClass defaultPlaceholderAttribute 
		
]

{ #category : 'asserting' }
WsPasswordInputExampleComponentTest >> assertViewModelLink [

	| password1 password2 password3 |
	self assert: passwordField value equals: model text.
	password1 := 'very secrete'.
	self changeElement: passwordField value: password1.
	self assert: model text equals: password1.
	toggleShowPasswordButton click.
	self assert: passwordField type equals: 'text'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	toggleShowPasswordButton click.
	self assert: passwordField type equals: 'password'.
	self assert: passwordField value equals: password1.
	self assert: model text equals: password1.
	password2 := 'hush!!!!'.
	self changeElement: passwordField value: password2.
	self assert: model text equals: password2.
	password3 := 'new secret password'.
	model text: password3.
self assert: passwordField value equals: password3.

		

]

{ #category : 'accessing' }
WsPasswordInputExampleComponentTest >> component: newComponent [

	super component: newComponent.
	toggleShowPasswordButton := shadowRoot querySelector:
		                WsToggleIconsComponent tagName.
	passwordField := shadowRoot querySelector: 'input'
]
