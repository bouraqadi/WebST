Class {
	#name : #WsLeafViewD,
	#superclass : #WsView,
	#category : #'WebST-Examples-CompositeViews'
}

{ #category : #rendering }
WsLeafViewD >> renderOuterHtmlOn: html [

	html paragraph: 'd'
]

{ #category : #accessing }
WsLeafViewD >> resources [

	^ {
		  (WsCssLink url: 'cssX').
		  (WsJsScript url: 'jsX') }
]
