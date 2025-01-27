Class {
	#name : 'WsInitTestView',
	#superclass : 'WsView',
	#category : 'WebST-Tests-Initialization',
	#package : 'WebST-Tests',
	#tag : 'Initialization'
}

{ #category : 'rendering' }
WsInitTestView >> levelName [
	^'Level 1'
]

{ #category : 'rendering' }
WsInitTestView >> renderOuterHtmlOn: html [

	html paragraph: self levelName
]
