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
		  (WsCssLink pathString: 'subViewLeafCss').
		  (WsJsScript pathString: 'subViewLeafJs').
		  (WsCssLink pathString: 'sharedCss').
		  (WsJsScript pathString: 'sharedJs') }
]
