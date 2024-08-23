Class {
	#name : 'WsViewForLeafComponentReferencedByView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'rendering' }
WsViewForLeafComponentReferencedByView >> renderOuterHtmlOn: html [

	html paragraph: self className
]

{ #category : 'accessing' }
WsViewForLeafComponentReferencedByView >> resources [

	^ {
		  (WsCssLink url: 'subViewLeafCss').
		  (WsJsScript url: 'subViewLeafJs').
		  (WsCssLink url: 'sharedCss').
		  (WsJsScript url: 'sharedJs') }
]
