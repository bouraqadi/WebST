Class {
	#name : 'WsTextModel',
	#superclass : 'Object',
	#instVars : [
		'text',
		'textPort'
	],
	#category : 'WebST-Library-Text',
	#package : 'WebST-Library',
	#tag : 'Text'
}

{ #category : 'accessing' }
WsTextModel class >> defaultText [
	^'...'
]

{ #category : 'accessing' }
WsTextModel class >> text: aString [
	^self new
		text: aString;
		yourself
]

{ #category : 'accessing' }
WsTextModel >> defaultText [
	^self class defaultText
]

{ #category : 'initialization' }
WsTextModel >> initialize [

	super initialize.
	textPort := HyCollectionPort notificationSelector: #value:.
	text := self defaultText 
]

{ #category : 'accessing' }
WsTextModel >> text [

	^ text
]

{ #category : 'accessing' }
WsTextModel >> text: aString [

	text := aString.
	textPort notifyWith: text
]
