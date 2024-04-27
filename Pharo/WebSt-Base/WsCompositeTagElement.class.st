Class {
	#name : #WsCompositeTagElement,
	#superclass : #WsTagElement,
	#traits : 'WsTCompositeElement - {#renderOuterHtmlOn:}',
	#classTraits : 'WsTCompositeElement classTrait',
	#category : #'WebSt-Base-Views'
}

{ #category : #rendering }
WsCompositeTagElement >> renderInnerHtmlOn: html [

	self renderChildrenOn: html
]
