Class {
	#name : #WsLeafViewB,
	#superclass : #WsView,
	#category : #'WebST-Examples-CompositeViews'
}

{ #category : #rendering }
WsLeafViewB >> renderOuterHtmlOn: html [

	html paragraph: 'b'
]

{ #category : #accessing }
WsLeafViewB >> resources [

	^ {
		  (WsCssLink url: 'cssX').
		  (WsJsScript url: 'jsX') }
]
