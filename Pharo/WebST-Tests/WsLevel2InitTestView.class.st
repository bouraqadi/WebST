Class {
	#name : 'WsLevel2InitTestView',
	#superclass : 'WsInitTestView',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsLevel2InitTestView >> levelName [ 
	^'Level 2'
]

{ #category : 'rendering' }
WsLevel2InitTestView >> renderOuterHtmlOn: html [

	super renderOuterHtmlOn: html.
	html render: WsBasicComponentForInitTest

]
