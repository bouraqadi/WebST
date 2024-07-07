Class {
	#name : #WsScoreExampleApp,
	#superclass : #WsSingleComponentApp,
	#category : #'WebST-Examples-Misc'
}

{ #category : #rendering }
WsScoreExampleApp class >> rootComponentClass [
	^WsScoreComponent 
]

{ #category : #initialization }
WsScoreExampleApp >> initRootComponent [

	super initRootComponent.
"	self rootComponent
		title: 'Football 1998 World Championship Finals';
		leftPlayerName: 'Brasil';
		rightPlayerName: 'France'"
]
