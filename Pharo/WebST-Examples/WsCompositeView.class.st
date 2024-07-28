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

{ #category : 'as yet unclassified' }
WsCompositeView >> resources [

	^ {
		  (WsCssLink url: 'cssABCD').
		  (WsJsScript url: 'jsABCD').
		  (WsCssLink url: 'cssA').
		  (WsJsScript url: 'jsA').
		  (WsCssLink url: 'cssY').
		  (WsJsScript url: 'jsY')		 }
]
