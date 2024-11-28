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
		  (WsCssLink fixedPathString: 'compositeCss').
		  (WsJsScript fixedPathString: 'compositeJs').
		  (WsCssLink fixedPathString: 'sharedCss').
		  (WsJsScript fixedPathString: 'sharedJs') }
]
