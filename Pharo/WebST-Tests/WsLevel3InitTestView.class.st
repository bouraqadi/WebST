Class {
	#name : 'WsLevel3InitTestView',
	#superclass : 'WsInitTestView',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsLevel3InitTestView >> levelName [ 
	^'Level 3'
]

{ #category : 'rendering' }
WsLevel3InitTestView >> renderOuterHtmlOn: html [

	super renderOuterHtmlOn: html.
	html render: WsLevel2InitTestComponent 
]
