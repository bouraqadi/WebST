Class {
	#name : #WsLeafViewC,
	#superclass : #WsView,
	#category : #'WebSt-Examples-CompositeViews'
}

{ #category : #rendering }
WsLeafViewC >> renderOuterHtmlOn: html [

	html paragraph: 'c'
]

{ #category : #accessing }
WsLeafViewC >> resources [

	^ {
		  (WsCssLink url: 'cssC').
		  (WsJsScript url: 'jsC') }
]
