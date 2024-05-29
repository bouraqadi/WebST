Class {
	#name : #WsIntermediateCompositeViewSuperclass,
	#superclass : #WsView,
	#category : #'WebST-Examples-CompositeViews'
}

{ #category : #rendering }
WsIntermediateCompositeViewSuperclass >> renderOuterHtmlOn: html [

	html render: WsMinimalComponent 
]
