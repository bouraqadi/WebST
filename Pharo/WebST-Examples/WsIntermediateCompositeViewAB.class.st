Class {
	#name : 'WsIntermediateCompositeViewAB',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsIntermediateCompositeViewAB >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'A+B'.
	html render: WsLeafViewA .
	html render: WsLeafViewB .

]

{ #category : 'accessing' }
WsIntermediateCompositeViewAB >> resources [

	^ {
		  (WsCssLink fixedPathString: 'cssA+B').
		  (WsJsScript fixedPathString: 'jsA+B').
		  (WsCssLink fixedPathString: 'cssX').
		  (WsJsScript fixedPathString: 'jsX').
		  (WsCssLink fixedPathString: 'cssY').
		  (WsJsScript fixedPathString: 'jsY') }
]
