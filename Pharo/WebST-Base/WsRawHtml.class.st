Class {
	#name : 'WsRawHtml',
	#superclass : 'WsElement',
	#instVars : [
		'htmlString'
	],
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'instance creation' }
WsRawHtml class >> htmlString: htmlString [
	^self new
	htmlString: htmlString;
	yourself
]

{ #category : 'WsView' }
WsRawHtml >> htmlString [

	^ htmlString
]

{ #category : 'WsView' }
WsRawHtml >> htmlString: anObject [

	htmlString := anObject
]

{ #category : 'rendering' }
WsRawHtml >> renderOuterHtmlOn: html [

	html html: self htmlString 
]
