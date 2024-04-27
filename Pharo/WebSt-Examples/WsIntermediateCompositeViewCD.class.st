Class {
	#name : #WsIntermediateCompositeViewCD,
	#superclass : #WsView,
	#category : #'WebSt-Examples-CompositeViews'
}

{ #category : #rendering }
WsIntermediateCompositeViewCD >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'C+D'.
	html render: WsLeafViewC .
	html render: WsLeafViewD .
	
]

{ #category : #accessing }
WsIntermediateCompositeViewCD >> resources [

	^ {
		  (WsCssLink url: 'cssC+D').
		  (WsJsScript url: 'jsC+D').
		  (WsCssLink url: 'cssX').
		  (WsJsScript url: 'jsX').
				  (WsCssLink url: 'cssY').
		  (WsJsScript url: 'jsY').	 }
]
