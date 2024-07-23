Class {
	#name : 'WsToggleIconsView',
	#superclass : 'WsBootstrapIcon1View',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'rendering' }
WsToggleIconsView >> renderOuterHtmlOn: html [

	html icon class: 'onIcon bi'.
	html icon class: 'offIcon bi'
]
