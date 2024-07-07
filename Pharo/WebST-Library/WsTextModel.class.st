Class {
	#name : #WsTextModel,
	#superclass : #Object,
	#instVars : [
		'text',
		'textPort'
	],
	#category : #'WebST-Library-Text'
}

{ #category : #accessing }
WsTextModel class >> text: aString [
	^self new
		text: aString;
		yourself
]

{ #category : #initialization }
WsTextModel >> initialize [

	super initialize.
	textPort := HyCollectionPort notificationSelector: #value:.
	text := ''
]

{ #category : #accessing }
WsTextModel >> text [

	^ text
]

{ #category : #accessing }
WsTextModel >> text: aString [

	text := aString.
	textPort notifyWith: text
]
