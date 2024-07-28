Class {
	#name : 'WsInitializableSubView',
	#superclass : 'WsView',
	#instVars : [
		'textContent'
	],
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsInitializableSubView >> renderOuterHtmlOn: html [

	html paragraph with:  self textContent
]

{ #category : 'accessing' }
WsInitializableSubView >> textContent [

	^ textContent
]

{ #category : 'accessing' }
WsInitializableSubView >> textContent: anObject [

	textContent := anObject
]
