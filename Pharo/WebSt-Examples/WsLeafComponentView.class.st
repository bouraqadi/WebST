Class {
	#name : #WsLeafComponentView,
	#superclass : #WsView,
	#category : #'WebSt-Examples-CompositeComponents'
}

{ #category : #rendering }
WsLeafComponentView >> renderOuterHtmlOn: html [

	html paragraph: 'leaf'
]

{ #category : #accessing }
WsLeafComponentView >> resources [

	^ {
		  (WsCssLink url: 'leafCss').
		  (WsJsScript url: 'leafJs').
		  (WsCssLink url: 'sharedCss').
		  (WsJsScript url: 'sharedJs') }
]
