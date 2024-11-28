Class {
	#name : 'WsCompositeView',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsCompositeView >> renderOuterHtmlOn: html [

	html heading
		level1;
		with: 'ABCD'.
	html render: WsIntermediateCompositeViewAB.
	html render: WsIntermediateCompositeViewCD.
	html render: WsIntermediateCompositeViewSubclass 
]

{ #category : 'accessing' }
WsCompositeView >> resources [

	^ {
		  (WsCssLink fixedPathString: 'cssABCD').
		  (WsJsScript fixedPathString: 'jsABCD').
		  (WsCssLink fixedPathString: 'cssA').
		  (WsJsScript fixedPathString: 'jsA').
		  (WsCssLink fixedPathString: 'cssY').
		  (WsJsScript fixedPathString: 'jsY') }
]
