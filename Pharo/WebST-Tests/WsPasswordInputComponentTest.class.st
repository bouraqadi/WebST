Class {
	#name : #WsPasswordInputComponentTest,
	#superclass : #WsMvcComponentTest,
	#instVars : [
		'passwordDisplay',
		'toggleShowPasswordButton'
	],
	#category : #'WebST-Tests-Library'
}

{ #category : #accessing }
WsPasswordInputComponentTest class >> componentClass [

	^ WsPasswordInputComponent 
]

{ #category : #asserting }
WsPasswordInputComponentTest >> changeModelValues [

	model text: 'new secret password'
]
