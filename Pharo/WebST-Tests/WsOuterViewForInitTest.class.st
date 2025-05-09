Class {
	#name : 'WsOuterViewForInitTest',
	#superclass : 'WsBasicViewForInitTest',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsOuterViewForInitTest >> levelName [ 
	^'Level 3'
]

{ #category : 'rendering' }
WsOuterViewForInitTest >> renderOuterHtmlOn: html [

	super renderOuterHtmlOn: html.
	html render: WsMiddleCompositeForInitTest 
]
