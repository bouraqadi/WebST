Class {
	#name : 'WsTogglePushButtonView',
	#superclass : 'WsToggleIconTextRowView',
	#category : 'WebST-Library-Buttons',
	#package : 'WebST-Library',
	#tag : 'Buttons'
}

{ #category : 'rendering' }
WsTogglePushButtonView >> viewBrushOn: html [
	^html button 
		bePush;
		class: 'btn';
		yourself
]
