Class {
	#name : 'WsTagElement',
	#superclass : 'WsElement',
	#category : 'WebST-Base-Views',
	#package : 'WebST-Base',
	#tag : 'Views'
}

{ #category : 'rendering' }
WsTagElement >> renderInnerHtmlOn: html [
	self subclassResponsibility 
]

{ #category : 'rendering' }
WsTagElement >> renderOuterHtmlOn: html [

	html
		tag: self tag
		with: [ self renderInnerHtmlOn: html ]
]

{ #category : 'accessing' }
WsTagElement >> tag [
	self subclassResponsibility 
]
