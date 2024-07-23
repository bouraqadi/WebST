Class {
	#name : 'WsCompositeComponentView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeComponents',
	#package : 'WebST-Examples',
	#tag : 'CompositeComponents'
}

{ #category : 'rendering' }
WsCompositeComponentView >> renderOuterHtmlOn: html [

	html heading
		level1;
		with: 'Composite'.
	html render: WsIntermediateComponent
]

{ #category : 'accessing' }
WsCompositeComponentView >> resources [

	^ {
		  (WsCssLink url: 'compositeCss').
		  (WsJsScript url: 'compositeJs').
		  (WsCssLink url: 'sharedCss').
		  (WsJsScript url: 'sharedJs') }
]
