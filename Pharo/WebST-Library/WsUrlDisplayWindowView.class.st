Class {
	#name : #WsUrlDisplayWindowView,
	#superclass : #WsWindowView,
	#category : #'WebST-Library-Windows'
}

{ #category : #rendering }
WsUrlDisplayWindowView >> renderBodyContentsOn: html [
	html object
		class: 'w-100 h-100 overflow-scroll'
]
