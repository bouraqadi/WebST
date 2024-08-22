Class {
	#name : 'WsToggleIconTextRowView',
	#superclass : 'WsBootstrapIcon1View',
	#instVars : [
		'onView',
		'offView'
	],
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'initialization' }
WsToggleIconTextRowView >> initialize [ 
	super initialize.
	onView := WsIconTextRowView new.
	offView := WsIconTextRowView new
]

{ #category : 'initialization' }
WsToggleIconTextRowView >> offIcon: icon [

	offView icon: icon
]

{ #category : 'initialization' }
WsToggleIconTextRowView >> offText: text [

	offView text: text
]

{ #category : 'initialization' }
WsToggleIconTextRowView >> onIcon: icon [
	onView icon: icon
]

{ #category : 'initialization' }
WsToggleIconTextRowView >> onText: text [

	onView text: text
]

{ #category : 'rendering' }
WsToggleIconTextRowView >> renderOuterHtmlOn: html [

	html span
		id: 'onView';
		with: [ html render: onView ].
	html span
		id: 'offView';
		with: [ html render: offView ].

]
