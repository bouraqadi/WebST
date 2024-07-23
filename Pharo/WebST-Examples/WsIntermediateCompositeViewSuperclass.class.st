Class {
	#name : 'WsIntermediateCompositeViewSuperclass',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsIntermediateCompositeViewSuperclass >> renderOuterHtmlOn: html [

	html render: WsMinimalComponent 
]
