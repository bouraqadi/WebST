Class {
	#name : #WsCompositeTagElement,
	#superclass : #WsTagElement,
	#traits : 'WsTCompositeElement - {#renderOuterHtmlOn:}',
	#classTraits : 'WsTCompositeElement classTrait',
	#category : #'WebST-Base-Views'
}

{ #category : #rendering }
WsCompositeTagElement >> renderInnerHtmlOn: html [

	self renderChildrenOn: html
]
