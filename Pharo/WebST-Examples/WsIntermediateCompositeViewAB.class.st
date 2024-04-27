Class {
	#name : #WsIntermediateCompositeViewAB,
	#superclass : #WsView,
	#category : #'WebST-Examples-CompositeViews'
}

{ #category : #rendering }
WsIntermediateCompositeViewAB >> renderOuterHtmlOn: html [

	html heading
		level2;
		with: 'A+B'.
	html render: WsLeafViewA .
	html render: WsLeafViewB .

]

{ #category : #accessing }
WsIntermediateCompositeViewAB >> resources [

	^ {
		  (WsCssLink url: 'cssA+B').
		  (WsJsScript url: 'jsA+B').		  (WsCssLink url: 'cssX').
		  (WsJsScript url: 'jsX').
		  (WsCssLink url: 'cssY').
		  (WsJsScript url: 'jsY') }
]
