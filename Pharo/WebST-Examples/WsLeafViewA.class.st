Class {
	#name : 'WsLeafViewA',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsLeafViewA >> renderOuterHtmlOn: html [

	html paragraph: 'a'
]

{ #category : 'accessing' }
WsLeafViewA >> resources [

	^ {
		  (WsCssLink url: 'cssA').
		  (WsJsScript url: 'jsA') }
]
