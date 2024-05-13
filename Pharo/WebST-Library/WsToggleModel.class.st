Class {
	#name : #WsToggleModel,
	#superclass : #Object,
	#instVars : [
		'isOn',
		'togglePort'
	],
	#category : #'WebST-Library-Buttons'
}

{ #category : #initialization }
WsToggleModel >> initialize [ 
	super initialize.
	isOn := false.
	togglePort := HyCollectionPort notificationSelector: #value:
]

{ #category : #accessing }
WsToggleModel >> isOn [

	^ isOn
]

{ #category : #accessing }
WsToggleModel >> isOn: aBoolean [

	isOn := aBoolean.
	togglePort notifyWith: isOn
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
