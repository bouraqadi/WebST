Class {
	#name : 'WsToggleIconTextRowView',
	#superclass : 'WsToggleView',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'rendering' }
WsToggleIconTextRowView >> renderViewContentOn: html [

	^ html render: WsIconTextRowView
]

{ #category : 'rendering' }
WsToggleIconTextRowView >> viewBrushOn: html [

	^ html span
]
