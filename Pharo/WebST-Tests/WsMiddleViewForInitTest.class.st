Class {
	#name : 'WsMiddleViewForInitTest',
	#superclass : 'WsBasicViewForInitTest',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsMiddleViewForInitTest >> levelName [ 
	^'Level 2'
]

{ #category : 'rendering' }
WsMiddleViewForInitTest >> renderOuterHtmlOn: html [

	super renderOuterHtmlOn: html.
	html render: WsBasicComponentForInitTest

]
