Class {
	#name : 'WsLeafViewRefencingComponent',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'rendering' }
WsLeafViewRefencingComponent >> renderOuterHtmlOn: html [
	html render: WsLeafComponentReferencedByView 
]
