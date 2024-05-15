Class {
	#name : #WsToggleModel,
	#superclass : #Object,
	#instVars : [
		'isOn',
		'isOnPort'
	],
	#category : #'WebST-Library-Buttons'
}

{ #category : #initialization }
WsToggleModel >> initialize [ 
	super initialize.
	isOn := false.
	isOnPort := HyCollectionPort notificationSelector: #value:
]

{ #category : #accessing }
WsToggleModel >> isOn [

	^ isOn
]

{ #category : #accessing }
WsToggleModel >> isOn: aBoolean [

	isOn := aBoolean.
	isOnPort notifyWith: isOn
]

{ #category : #actions }
WsToggleModel >> switchOff [

	self isOn: false
]

{ #category : #actions }
WsToggleModel >> switchOn [
	self isOn: true
]

{ #category : #actions }
WsToggleModel >> toggle [

	self isOn: self isOn not
]
