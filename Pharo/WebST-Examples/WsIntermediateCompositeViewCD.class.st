Class {
	#name : 'WsIntermediateCompositeViewCD',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsIntermediateCompositeViewCD >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'C+D'.
	html render: WsLeafViewC .
	html render: WsLeafViewD .
	
]

{ #category : 'accessing' }
WsIntermediateCompositeViewCD >> resources [

	^ {
		  (WsCssLink fixedPathString: 'cssC+D').
		  (WsJsScript fixedPathString: 'jsC+D').
		  (WsCssLink fixedPathString: 'cssX').
		  (WsJsScript fixedPathString: 'jsX').
		  (WsCssLink fixedPathString: 'cssY').
		  (WsJsScript fixedPathString: 'jsY') }
]
