Class {
	#name : 'WsWebBackComponent',
	#superclass : 'WsIconTextComponent',
	#traits : 'WsTConcreteComponent',
	#classTraits : 'WsTConcreteComponent classTrait',
	#instVars : [
		'webHistoryController'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'accessing' }
WsWebBackComponent class >> defaultIconAttribute [

	^ 'bi-arrow-left'
]

{ #category : 'initialization' }
WsWebBackComponent >> beReady [

	super beReady.
	webHistoryController := WsWebHistoryController new.
	webHistoryController makeBackButton: self.

	
]
