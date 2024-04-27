Class {
	#name : #WsLeafViewA,
	#superclass : #WsView,
	#category : #'WebSt-Examples-CompositeViews'
}

{ #category : #rendering }
WsLeafViewA >> renderOuterHtmlOn: html [

	html paragraph: 'a'
]

{ #category : #accessing }
WsLeafViewA >> resources [

	^ {
		  (WsCssLink url: 'cssA').
		  (WsJsScript url: 'jsA') }
]
