Class {
	#name : #WsWindowsExampleView,
	#superclass : #WsView,
	#category : #'WebST-Examples-Misc'
}

{ #category : #rendering }
WsWindowsExampleView >> renderOuterHtmlOn: html [

	html render: WsUrlDisplayWindowComponent dataAttributes: { #url -> 'https://esug.org/2024-Conference/conf2024.html' }.
	html render: WsUrlDisplayWindowComponent dataAttributes: { #url -> 'https://pharojs.org/' }.
	html render: WsUrlDisplayWindowComponent dataAttributes: { #url -> 'https://youtu.be/9suT78sOGEc?si=Nb8lRGWBcbCr02Ht' }.
]
