Class {
	#name : 'WsListView',
	#superclass : 'WsBootstrap5View',
	#category : 'WebST-Library-Lists',
	#package : 'WebST-Library',
	#tag : 'Lists'
}

{ #category : 'rendering' }
WsListView >> renderOuterHtmlOn: html [

	html unorderedList class: 'list-group'
]
