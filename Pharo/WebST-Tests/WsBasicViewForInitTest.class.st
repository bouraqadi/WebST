Class {
	#name : 'WsBasicViewForInitTest',
	#superclass : 'WsView',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsBasicViewForInitTest >> levelName [
	^'Level 1'
]

{ #category : 'rendering' }
WsBasicViewForInitTest >> renderOuterHtmlOn: html [

	html paragraph: self levelName
]
