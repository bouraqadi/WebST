Class {
	#name : 'WsLeafViewC',
	#superclass : 'WsView',
	#category : 'WebST-Examples-CompositeViews',
	#package : 'WebST-Examples',
	#tag : 'CompositeViews'
}

{ #category : 'rendering' }
WsLeafViewC >> renderOuterHtmlOn: html [

	html paragraph: 'c'
]

{ #category : 'accessing' }
WsLeafViewC >> resources [

	^ {
		  (WsCssLink pathString: 'cssC').
		  (WsJsScript pathString: 'jsC') }
]
