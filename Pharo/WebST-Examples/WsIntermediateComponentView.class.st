Class {
	#name : 'WsIntermediateComponentView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'rendering' }
WsIntermediateComponentView >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'Intermediate'.
	html render: WsLeafViewRefencingComponent.
	html render: WsLeafComponent
]

{ #category : 'accessing' }
WsIntermediateComponentView >> resources [

	^ {
		  (WsCssLink url: 'intermediateCss').
		  (WsJsScript url: 'intermediateJs').
		  (WsCssLink url: 'sharedCss').
		  (WsJsScript url: 'sharedJs') }
]
