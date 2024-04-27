Class {
	#name : #WsListView,
	#superclass : #WsBootstrap5View,
	#category : #'WebST-Library-List'
}

{ #category : #rendering }
WsListView >> renderOuterHtmlOn: html [

	html unorderedList class: 'list-group'
]
