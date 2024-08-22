Class {
	#name : 'WsWebHistoryController',
	#superclass : 'PjDomController',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'navigating' }
WsWebHistoryController >> goBackToPreviousPage [
	history back
]

{ #category : 'events' }
WsWebHistoryController >> makeBackButton: anElement [
	self onClickElement: anElement do: [ self goBackToPreviousPage ]
]
