Class {
	#name : #WsToggleIconsView,
	#superclass : #WsBootstrapIcon1View,
	#instVars : [
		'onIconCss',
		'offIconCss'
	],
	#category : #'WebST-Library-Buttons'
}

{ #category : #accessing }
WsToggleIconsView >> offIconCss [

	^ offIconCss
]

{ #category : #accessing }
WsToggleIconsView >> offIconCss: anObject [

	offIconCss := anObject
]

{ #category : #accessing }
WsToggleIconsView >> onIconCss [

	^ onIconCss
]

{ #category : #accessing }
WsToggleIconsView >> onIconCss: anObject [

	onIconCss := anObject
]

{ #category : #rendering }
WsToggleIconsView >> renderOuterHtmlOn: html [

	html icon class: self onIconCss , ' onIcon'.
	html icon class: self offIconCss , ' offIcon'
]
