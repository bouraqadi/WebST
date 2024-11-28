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
		  (WsCssLink fixedPathString: 'intermediateCss').
		  (WsJsScript fixedPathString: 'intermediateJs').
		  (WsCssLink fixedPathString: 'sharedCss').
		  (WsJsScript fixedPathString: 'sharedJs') }
]
