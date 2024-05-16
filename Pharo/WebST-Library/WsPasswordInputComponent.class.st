Class {
	#name : #WsPasswordInputComponent,
	#superclass : #WsMvcComponent,
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
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
