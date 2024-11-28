Class {
	#name : 'WsLeafComponentView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'rendering' }
WsLeafComponentView >> renderOuterHtmlOn: html [

	html paragraph: 'leaf'
]

{ #category : 'accessing' }
WsLeafComponentView >> resources [

	^ {
		  (WsCssLink fixedPathString: 'leafCss').
		  (WsJsScript fixedPathString: 'leafJs').
		  (WsCssLink fixedPathString: 'sharedCss').
		  (WsJsScript fixedPathString: 'sharedJs') }
]
